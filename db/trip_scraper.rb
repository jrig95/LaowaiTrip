require 'csv'
require 'watir'
require 'webdrivers'
require 'nokogiri'
require 'httparty'
require 'open-uri'
require 'byebug'

# Creating class object
class Scrape
  def trip_scraper
    # CSV LOOP
    # Defining CSV headers, seperating columns by '|'
    headers =  ["link", "place_name", "city_name", "price_by_night", "rating", "address", "images", "amenities", "description", "thirdparty"]
    CSV.open("places.csv", "wb", {col_sep: '|', force_quotes: true}) do |csv|
      # pushing headers to csv table
      csv << headers

      # A hash of cities and their city id's according to Trip.com for each city's index page
      cities = {"Beijing" => 1,"Shanghai" => 2, "Tianjin" => 3, "Chongqing" => 4, "Harbin" => 5, "Dalian" => 6, "Qingdao" => 7, "Xi'an" => 7, "Dunhuang" => 11, "Nanjing" => 12, "Suzhou" => 14, "Hangzhou" => 17, "Xiamen" => 26, "Zhangjiajie" => 27, "Chengdu" => 28, "Shenzhen" => 30, "Zhuhai" => 31, "Guangzhou" => 32, "Guilin" => 33, "Kunming" => 34, "Xishuangbanna" => 35, "Dali" => 36, "Lijiang" => 37, "Guiyang" => 38, "Wulumuqi" => 39, "Lhasa" => 41, "Haikou" => 42, "Sanya" => 43, "Wanning" => 45, "Wuhan" => 477, "Shenyang" => 451, "Fuzhou" => 258, "Huizhou" => 299, "Yangshuo" => 871 }

      # CITIES LOOP
      # injecting city id, check in/out dates into each index link and storing them into an array
      cities.each do |city, city_id|
        index_url = "https://us.trip.com/hotels/list?city=#{city_id}&countryId=1&checkin=#{Date.today+1}&checkout=#{Date.today+2}&directSearch=0&crn=1&adult=2&children=0&searchBoxArg=t&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"
        index_urls = []
        places = []
        index_urls << index_url
        # setting the default timout from 60 seconds to 600
        Watir.default_timeout = 600
        browser = Watir::Browser.new
        browser.goto index_url

        # locating the links in the index
        links = browser.spans(class: 'name font-bold')
        # clicking to each hotel in the index page
        puts 'Starting to iterate over the links...'
          links.each_with_index do |link, index|
            puts '====Clicking on one link===='
            link.click
            sleep(5)
            # capping the number of clicks to open show pages
            if index == 2
              break
            end
          end

        show_urls = []
        browser.windows.to_enum.to_a.each_with_index do |_window, index|
          if browser.windows.to_enum.to_a[index+1]&.use
            show_urls << browser.url
          end
        end

          show_urls.each do |show_url|
            unparsed_page = HTTParty.get(show_url)
            parsed_page = Nokogiri::HTML(unparsed_page)
            images = []
            doc = Watir::Browser.new
            doc.goto(show_url)
            # locating first price location
            if doc.element(css: "p.price").present?
              js_doc = doc.element(css: "p.price").wait_until(&:present?)
              full_doc = Nokogiri::HTML(js_doc.inner_html)
              price = full_doc.text.delete('$').to_i
            # locating second price location if first price is absent
            elsif doc.element(css: "span.detail-headline-price_price").present?
              js_doc = doc.element(css: "span.detail-headline-price_price").wait_until(&:present?)
              full_doc = Nokogiri::HTML(js_doc.inner_html)
              price = full_doc.text.delete('$').to_i
            # if there's no price listed
            elsif js_doc == nil
              price = "Sold Out"
            end

            # adding images to array
            doc.images(class: 'm-lazyImg__img').to_a.each do |image|
              images << image.src
            end

            # creating a hash of a place
            place = {
            link: show_url,
            place_name: parsed_page.css("h1.detail-headline_name").text,
            city_name: city,
            price_by_night: price,
            rating: parsed_page.css('b.detail-headreview_score_value')[0].children.text,
            address: parsed_page.css('span.detail-headline_position_text').text,
            image: [images[0],images[7],images[8]],
            amenities: parsed_page.css('span.detail-headamenity_name').text,
            description: parsed_page.css('span.detail-headline_desc_text').text,
            thirdparty: 'trip.com'
            }

            puts place
            places << place

            # Puttting Place into csv
            link = place[:link]
            place_name = place[:place_name]
            city_name = place[:city_name]
            price_by_night = place[:price_by_night]
            rating = place[:rating]
            address = place[:address]
            image = place[:image]
            amenities = place[:amenities]
            description = place[:description]
            thirdparty = place[:thirdparty]
            csv << [link, place_name, city_name, price_by_night, rating, address, image, amenities, description, thirdparty]
            # Closing chrome show page
            doc.close
          end
      end
    end
  end
end
