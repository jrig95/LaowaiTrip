require 'watir'
require 'webdrivers'
require 'nokogiri'
require 'httparty'
require 'open-uri'

class Scrape
  def trip_scraper
    # A hash of cities and their city id's according to Trip.com for each city's index page
    # {"Beijing" => 1,
    cities = {"Shanghai" => 2, "Tianjin" => 3}
      # , "Chongqing" => 4, "Harbin" => 5, "Dalian" => 6, "Qingdao" => 7, "Xi'an" => 7, "Dunhuang" => 11, "Nanjing" => 12, "Suzhou" => 14, "Hangzhou" => 17, "Xiamen" => 26, "Zhangjiajie" => 27, "Chengdu" => 28, "Shenzhen" => 30, "Zhuhai" => 31, "Guangzhou" => 32, "Guilin" => 33, "Kunming" => 34, "Xishuangbanna" => 35, "Dali" => 36, "Lijiang" => 37, "Guiyang" => 38, "Wulumuqi" => 39, "Lhasa" => 41, "Haikou" => 42, "Sanya" => 43, "Wanning" => 45, "Wuhan" => 477, "Shenyang" => 451, "Fuzhou" => 258, "Huizhou" => 299, "Yangshuo" => 871 }

    # create empty arrays of hotels and index_urls
    index_urls = []
    places = []

    # iterate over each link
    cities.each do |city, city_id|
      index_url = "https://us.trip.com/hotels/list?city=#{city_id}&countryId=1&checkin=#{Date.today}&checkout=#{Date.today+1}&directSearch=0&crn=1&adult=2&children=0&searchBoxArg=t&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"

      # pushing index_url to index_urls hash
      index_urls << index_url

      # setting the default timout from 60 seconds to 180
      Watir.default_timeout = 400
      puts 'Opening url...'
      # creating a browser object using Watir
      browser = Watir::Browser.new
      browser.goto index_url

      # locating the links in the index
      puts 'Getting hotel links...'
      links = browser.spans(class: 'name font-bold')

      # clicking to each hotel in the index page
      puts 'Starting to iterate over the links...'
      links.each do |link|
        puts '====Clicking on one link===='
        link.click
        sleep(5)
      end

      # collecting the urls of each show page
      show_urls = []
      browser.windows.to_enum.to_a.each_with_index do |window, index|
        if browser.windows.to_enum.to_a[index+1]&.use
          show_urls << browser.url
          # window.close
        end
      end

      # iterating through each show page
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
        elsif js_doc == nil
          price = "Sold Out"
        end

        # adding images to array
        doc.images(class: 'm-lazyImg__img').to_a.each do |image|
          images << image.src
        end

        # creating a hash of a hotel
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
        thirdparty: "trip.com"
        }
      # pushing hotel hash to hotels array
      places << place
      doc.close
      first_scraped_place = Place.new(place)
      first_scraped_place.user = User.first
      first_scraped_place_image_one = URI.open(place[:image][0])
      first_scraped_place_image_two = URI.open(place[:image][1])
      first_scraped_place_image_three = URI.open(place[:image][2])
      first_scraped_place.photos.attach(io: first_scraped_place_image_one, filename: "hotel_image.jpg", content_type: 'image/jpeg')
      first_scraped_place.photos.attach(io: first_scraped_place_image_two, filename: "hotel_image.jpg", content_type: 'image/jpeg')
      first_scraped_place.photos.attach(io: first_scraped_place_image_three, filename: "hotel_image.jpg", content_type: 'image/jpeg')

      first_scraped_place.save!
      puts "place name saved? #{first_scraped_place.place_name}"
      end
    end
  end
end
