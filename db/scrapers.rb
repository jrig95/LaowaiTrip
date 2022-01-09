require 'open-uri'
require 'nokogiri'
require 'watir'

class Scrape
    def scrape_trip_url
        url = "https://www.trip.com/hotels/list?city=30&countryId=1&checkin=2022/01/06&checkout=2022/01/07&optionId=30&optionType=City&directSearch=0&display=Shenzhen&crn=1&adult=1&children=0&searchBoxArg=t&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"

        doc = Watir::Browser.new

        doc.goto(url)
        # js_doc = doc.element(css: "#meta-real-price")wait_until(&:present?)
        hotel =  doc.div(id: "meta-real-price").wait_until(&:present?)
        full_doc = Nokogiri::HTML.parse(doc.html)
        price = full_doc.css('#meta-real-price')
        # return full_doc
        return price
        # return hotel

    end
end


# require 'nokogiri'
# require 'byebug'
# require 'httparty'

# puts "Where would you like to stay?"
# city = gets.chomp

# puts "when would you like to check in? example '2022/01/06/' "
# checkin = gets.chomp

# puts "when would you like to check in? example '2022/01/07/' "
# checkout = gets.chomp

  # def scraper
  #   url = "https://us.trip.com/hotels/list?city=2&countryId=0&checkin=2022/01/06&checkout=2022/01/07&optionId=2&optionType=City&directSearch=0&display=Shanghai&crn=1&adult=1&children=0&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"
  #   unparsed_page = HTTParty.get(url)
  #   parsed_page = Nokogiri::HTML(unparsed_page)
  #   hotels = Array.new
  #   hotel_listings = parsed_page.css('div.hotel-info')
  #   # to scrape each page beginning
  #   # page = 1
  #   # per_page = hotel_listings.count
  #   # total = parsed_page.css('div.current-filter-wrap').text.split(' ')[1].gsub(',','').to_i
  #   # last_page = (total.to_f/per_page.to_f).round
  #   # while page <= last_page
  #   #   pagination_url = "https://us.trip.com/hotels/list?city=2&countryId=0&checkin=2022/01/06&checkout=2022/01/07&optionId=2&optionType=City&directSearch=0&display=Shanghai&crn=1&adult=1&children=0&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=#{page}"
  #   #   pagination_unparsed_page = HTTParty.get(pagination_url)
  #   #   pagintation_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
  #   #   pagination_hotel_listings = pagination_parsed_page.css('div.hotel-info')
  #   #   pagination_hotel_listings.each do |hotel_listing|
  #   # to scrape each page end
  #     hotel_listings.each do |hotel_listing|
  #       hotel = {
  #         name: hotel_listing.css('span.name.font-bold').text,
  #         review: hotel_listing.css('span.review-item').text,
  #         location: hotel_listing.css('span.map_poi').text,
  #         image: hotel_listing.css('img.m-lazyImg__img')[0].attributes["src"].value
  #       }
  #       hotels << hotel
  #     end
  #   # end
  #   byebug
  # end
