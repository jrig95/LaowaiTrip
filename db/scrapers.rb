# require 'open-uri'
# require 'nokogiri'
# require 'watir'

# class Scrape
#     def scrape_trip_url
#         url = "https://www.trip.com/hotels/list?city=30&countryId=1&checkin=2022/01/06&checkout=2022/01/07&optionId=30&optionType=City&directSearch=0&display=Shenzhen&crn=1&adult=1&children=0&searchBoxArg=t&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"

#         doc = Watir::Browser.new

#         doc.goto(url)
#         # js_doc = doc.element(css: "#meta-real-price")wait_until(&:present?)
#         # hotel =  doc.div(id: "meta-real-price").wait_until(&:present?)
#         full_doc = Nokogiri::HTML.parse(doc.html)
#         price = full_doc.css('#meta-real-price')
#         # return full_doc
#         return price
#         # return hotel

#     end
# end

require 'nokogiri'
require 'byebug'
require 'httparty'

def trip_scraper
  url = "https://us.trip.com/hotels/list?city=2&countryId=0&checkin=2022/01/06&checkout=2022/01/07&optionId=2&optionType=City&directSearch=0&display=Shanghai&crn=1&adult=1&children=0&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  hotels = Array.new
  hotel_listings = parsed_page.css('div.hotel-info')
  hotel_listings.each do |hotel_listing|
    hotel = {
      name: hotel_listing.css('span.name.font-bold').text,
      description: hotel_listing.css('span.review-item').text,
      location: hotel_listing.css('span.map_poi').text,
      image: hotel_listing.css('img.m-lazyImg__img')[0].attributes["src"].value,
      price: hotel_listing.css('div.meta-real-price')
      }
      hotels << hotel
  end
end
