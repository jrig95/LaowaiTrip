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

first_place_image = URI.open('https://t-cf.bstatic.com/xdata/images/hotel/max1280x900/327419823.jpg?k=482a587ee9cd4aca228e48c7e6d38173fafd2981e93dd9367532b2a93d0c8f6b&o=&hp=1')
first_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "Shanghai W on the Bund", description: "A beautiful hotel on the north bund ", price_by_night: 159, view: "bund view", available: true,max_guest: 4,number_bathrooms: 4, address:"66 Lvshun Road, Hongkou, Shanghai, China", number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub")
first_place.photos.attach(io: first_place_image, filename: 'shanghai_w.jpeg', content_type: 'image/jpeg')
first_place.save!

second_place_image_one = URI.open('https://images.getaroom-cdn.com/image/upload/s--Y55dO4d_--/c_limit,e_improve,fl_lossy.immutable_cache,h_940,q_auto:good,w_940/v1620722391/abfa10e5894f5f001b68f34605e400fc5c666a6d?atc=e7cd1cfa')
second_place_image_two = URI.open('https://cdn.kiwicollection.com/media/property/PR008349/xl/008349-01-exterior-shaghai-skyline.jpg?cb=1435069697')
second_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "The Peace Hotel", description: "A beautiful hotel next to the bund", price_by_night: 160, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"20 East Nanjing Road, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub")
second_place.photos.attach(io: second_place_image_one, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')
second_place.photos.attach(io: second_place_image_two, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')
second_place.save!

third_place_image = URI.open('https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/95126675.jpg?k=6c74e8b295ad1527ebefea7b56f96a2ac3e6ec49344d089a462b3abca62131e8&o=&hp=1')
third_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "JW Marriot", description: "A beautiful hotel in People's Square", price_by_night: 160, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"399 Nanjing West Road, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub")
third_place.photos.attach(io: third_place_image, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')
third_place.save!


puts "Done"
