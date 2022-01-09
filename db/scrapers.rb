# require 'open-uri'
# require 'nokogiri'
# require 'watir'


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
require 'open-uri'
class Scrape
  def trip_scraper
    url = "https://us.trip.com/hotels/list?city=2&countryId=0&checkin=2022/01/06&checkout=2022/01/07&optionId=2&optionType=City&directSearch=0&display=Shanghai&crn=1&adult=1&children=0&travelPurpose=0&ctm_ref=ix_sb_dl&domestic=1"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    places = Array.new
    place_listings = parsed_page.css('div.hotel-info')
    # puts "place listings"
    # puts place_listings
    # puts "place listing in a string"
    place_listings.each do |place_listing|
      place = {
        place_name: place_listing.css('span.name.font-bold').text,
        description: place_listing.css('span.review-item').text,
        # location: hotel_listing.css('span.map_poi').text,
        image: place_listing.css('img.m-lazyImg__img')[0].attributes["src"].value,
        # price: hotel_listing.css('div.meta-real-price')
        }
        # puts place
        places << place
        first_scraped_place = Place.new(place)
        first_scraped_place.user = User.first

        first_scraped_place_image = URI.open("https:#{place[:image]}")
        first_scraped_place.photos.attach(io: first_scraped_place_image, filename: 'place_image.jpg', content_type: 'image/jpeg')

        first_scraped_place.save!
        puts "place name saved? #{first_scraped_place.place_name}"
    end
  end
end
