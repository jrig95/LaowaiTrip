# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Place.destroy_all

puts "Creating places..."

require "open-uri"

first_user = User.first
first_place_image = URI.open('https://www.planetware.com/wpimages/2019/05/china-shanghai-best-hotels-amanyangyun.jpg')
first_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "The Marriot on the Bund", description: "A beautiful hotel on the bund ", price_by_night: 159, view: "bund view", available: true,max_guest: 4,number_bathrooms: 4, address:"1234 W Beijing road", number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub")
first_place.photo.attach(io: first_place_image, filename: 'shanghai_room.jpeg', content_type: 'image/jpeg')
first_place.save!

second_place_image = URI.open('https://www.planetware.com/wpimages/2019/05/china-shanghai-best-hotels-kerry-hotel-pudong-shanghai.jpg')
second_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "The PW on the Bund", description: "A beautiful hotel next to the bund", price_by_night: 160, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"1254 W Beijing road",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub")
second_place.photo.attach(io: second_place_image, filename: 'shanghai_pool.jpeg', content_type: 'image/jpeg')
second_place.save!

puts "Done"
