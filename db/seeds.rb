require "open-uri"
require 'csv'
puts "Creating places..."
Place.destroy_all # This is all commented out because you're seeding on top of the current database


# Shanghai Places
  # 2. Peace Hotel/ Trip.com
  second_place_image_one = URI.open('https://images.getaroom-cdn.com/image/upload/s--Y55dO4d_--/c_limit,e_improve,fl_lossy.immutable_cache,h_940,q_auto:good,w_940/v1620722391/abfa10e5894f5f001b68f34605e400fc5c666a6d?atc=e7cd1cfa')
  second_place_image_two = URI.open('https://cdn.kiwicollection.com/media/property/PR008349/xl/008349-01-exterior-shaghai-skyline.jpg?cb=1435069697')
  second_place_image_three = URI.open('https://ak-d.tripcdn.com/images/20080m000000dh47mF827_Z_1080_808_R5_D.jpg')
  second_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "The Peace Hotel", description: "A beautiful hotel next to the bund", price_by_night: "Sold Out", view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"20 East Nanjing Road, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://us.trip.com/hotels/shanghai-hotel-detail-375539/fairmont-peace-hotel/?cityId=2&checkIn=2022-01-10&checkOut=2022-01-11&adult=1&children=0&crn=1&ages=&travelpurpose=0&curr=USD&link=title&hoteluniquekey=H4sIAAAAAAAAAON6yMjFK8Fo8B8GGIWYOBilTjNyHNrU185s8drYkQEEbkx38AQzHsx2COApBDMdQh0mMdpwgtkmcx0EwYwtMx2UFBRYNGEqDGEMi1a2IFaObVwSLFEMTmwcfU8ZJVhmMH7-KraREaxEocBhByPTCcb3jAuYPk2dxrWLCaroEBMrx1l5CZZTTAyXmBhuMTE8YoKY84qJ4RMTwy-YuiZmhi5mhknMENWzmCGKFjEzCLGC_SKlYGqcaGlgZJJmYmqSZGJolmZpZmiaZpZibJSSnGJmZGyhwK3Ru-19H5uR2ClGYUMzEwMzC0tLC0NzAxO97BSjfAMrZilGNw_GIDYTE0dXI5coGS5mZ79IiL8ZPthLMYcGuygyV3CraNRJOiSxpubphgZnXOQoYOxiZBNg9GCMYFzFyAAAkpvXwXIBAAA", thirdparty: "trip.com", rating: "4.8")

  second_place.photos.attach(io: second_place_image_one, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')
  second_place.photos.attach(io: second_place_image_two, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')
  second_place.photos.attach(io: second_place_image_three, filename: 'shanghai_peace.jpeg', content_type: 'image/jpeg')

  second_place.save!

  # 3. JW Marriot/ Trip.com
  third_place_image_one = URI.open('https://t-cf.bstatic.com/xdata/images/hotel/max1024x768/95126675.jpg?k=6c74e8b295ad1527ebefea7b56f96a2ac3e6ec49344d089a462b3abca62131e8&o=&hp=1')
  third_place_image_two = URI.open('https://ak-d.tripcdn.com/images/20090a00000056siw14F1_Z_1080_808_R5_D.jpg')
  third_place_image_three = URI.open('https://ak-d.tripcdn.com/images/20080m000000dh47mF827_Z_1080_808_R5_D.jpg')
  third_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "JW Marriot", description: "A beautiful hotel in People's Square", price_by_night: 160, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"399 Nanjing West Road, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://us.trip.com/hotels/shanghai-hotel-detail-375216/jw-marriott-hotel-shanghai-at-tomorrow-square/?cityId=2&checkIn=2022-01-10&checkOut=2022-01-11&adult=1&children=0&crn=1&ages=&travelpurpose=0&curr=USD&link=title&hoteluniquekey=H4sIAAAAAAAAAONaysjFK8Fo8B8GGIWYOBil-hk5fh_6PoPJkQEEMrodPMGME_0OATyTGCU5YTxBW67riwuWdjs4sXJcrZFgmcG44bPYRkawdEOiww5GphOMXYwLmB4dlt3FBFFyCEjPFJRgOcXEcImJ4RYTwyMmhldMDJ-YGH5BVTQxM3QxM0xihqibxcywiJlBiBXsHikF02QD82QL8-S0JPM0k6QUcwsLw0RTAwsTA2OLtBQDw1QFbo3Nm9_3sRmJnWIUNjQzMTCzsLS0MDQ3MNHLTjHKN7BilmJ082AMYnMyMDc2M4-S4WJ29osUBLuY4YO9FHNosIsicwW3ikadpEMSa2qebmhwxkWOAqA32AQYPRgjGFcxMgAAhc0S0zYBAAA", thirdparty: "trip.com", rating: "4.8")
  third_place.photos.attach(io: third_place_image_one, filename: 'shanghai_jw.jpeg', content_type: 'image/jpeg')
  third_place.photos.attach(io: third_place_image_two, filename: 'shanghai_jw.jpeg', content_type: 'image/jpeg')
  third_place.photos.attach(io: third_place_image_three, filename: 'shanghai_jw.jpeg', content_type: 'image/jpeg')
  third_place.save!

  # 4. SH Airbnb
  fourth_place_image_one = URI.open('https://a0.muscache.com/im/pictures/df7d1f00-ae3a-4706-8e4e-884dad8bdb41.jpg?im_w=1200')
  fourth_place_image_two = URI.open('https://a0.muscache.com/im/pictures/5ad9723e-ded5-4093-b930-74679fa37145.jpg?im_w=720')
  fourth_place_image_three = URI.open('https://a0.muscache.com/im/pictures/miso/Hosting-19821414/original/66b89f5f-0c07-4551-8e5b-5048265998b3.jpeg?im_w=720')
  fourth_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "Bund Japanese folk style", description: "Located on the 23rd floor of Hengsheng Peninsula International Center Building, No. 205, Wujie Road, Hongkou District, the Japanese-style tatami room with river view in the North Bund, all photos are authentic and taken on your mobile phone.", price_by_night: 590, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"No. 205, Wujie Road, Hongkou District, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://www.airbnb.com/rooms/19821414?check_in=2022-01-11&check_out=2022-01-12&federated_search_id=353f85ab-6ae7-4fd0-b225-2e4bb071b1f0&source_impression_id=p3_1641800411_L7bd%2BKYqKprH4Km8", thirdparty: "airbnb", rating: "4.8")
  fourth_place.photos.attach(io: fourth_place_image_one, filename: 'shanghai_airbbnb.jpeg', content_type: 'image/jpeg')
  fourth_place.photos.attach(io: fourth_place_image_two, filename: 'shanghai_airbnb.jpeg', content_type: 'image/jpeg')
  fourth_place.photos.attach(io: fourth_place_image_three, filename: 'shanghai_airbnb.jpeg', content_type: 'image/jpeg')
  fourth_place.save!

  # 5. SH Ritz Carlton
  fifth_place_image_one = URI.open('https://himg1.qunarzz.com/imgs/202103/06/C.C9-FU2C7Jw8os7JXA480s.jpg')
  fifth_place_image_two = URI.open('http://ugcimg.qunarzz.com/imgs/202108/23/Ol4mXmFbmhAL3KOWm1024.jpg')
  fifth_place_image_three = URI.open('http://ugcimg.qunarzz.com/imgs/202108/23/Ol4mXmFbmUrMWvNNm1024.jpg')
  fifth_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "Pudong Ritz Carlton", description: "Ritz Carlton in Pudong", price_by_night: 590, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"浦东新区陆家嘴世纪大道8号上海国金中心",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://hotel.qunar.com/cn/shanghai_city/dt-5666/?fromDate=2022-01-15&toDate=2022-01-16&highQuality=true&bellaId=9JEBCjVZy_Y7F-dbyGnOt", thirdparty: "qunar", rating: "4.8")
  fifth_place.photos.attach(io: fifth_place_image_one, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  fifth_place.photos.attach(io: fifth_place_image_two, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  fifth_place.photos.attach(io: fifth_place_image_three, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  fifth_place.save!

  # 6. SH Hostelworld
  sixth_place_image_one = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/4/46215/65.jpg')
  sixth_place_image_two = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/4/46215/23.jpg')
  sixth_place_image_three = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/4/46215/36.jpg')
  sixth_place = Place.new(user: first_user, city_name: "Shanghai", place_name: "Shanghai Blue Mountain International Youth Hostel", description: "
  Blue Mountain Bund Youth Hostel is centrally located near East Nanjing Road metro station, 'just five minutes' walk from Nanjing Road and ten minutes away from the Bund'. Our guests say this means it's 'near enough everything to be easy but quiet at night'.", price_by_night: 87, view: "bund view", available: true,max_guest: 6, number_bathrooms: 2, address:"350 South Shanxi Road, Shanghai, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://www.hostelworld.com/pwa/hosteldetails.php/Shanghai-Blue-Mountain-International-Youth-Hostel/Shanghai/46215?from=2022-01-11&to=2022-01-14&guests=2", thirdparty: "hostelworld", rating: "4.8")
  sixth_place.photos.attach(io: sixth_place_image_one, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  sixth_place.photos.attach(io: sixth_place_image_two, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  sixth_place.photos.attach(io: sixth_place_image_three, filename: 'shanghai_ritz.jpeg', content_type: 'image/jpeg')
  sixth_place.save!

  # Sanya Places

  # 1. Sanya Atlantis
  first_sanya_place_image_one = URI.open('https://ak-d.tripcdn.com/images/200s1900000169opw2822_Z_1080_808_R5_D.jpg')
  first_sanya_place_image_two = URI.open('https://ak-d.tripcdn.com/images/0204q120008vlcih67860_Z_1080_808_R5_D.jpg')
  first_sanya_place_image_three = URI.open('https://ak-d.tripcdn.com/images/200c0x000000l9uguF3F6_Z_1080_808_R5_D.jpg')
  first_sanya_place = Place.new(user: first_user, city_name: "Sanya", place_name: "Atlantis Sanya", description: "The Atlantis Sanya provides a great place for travelers to relax after a busy day. The Atlantis Sanya is an ideal choice for travelers who want to take in the sights and sounds of Sanya.", price_by_night: 2500, view: "beach view", available: true,max_guest: 6, number_bathrooms: 2, address:"Sanya, Hainan, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://us.trip.com/hotels/sanya-hotel-detail-14249344/atlantis-sanya/?cityId=43&checkIn=2022-01-11&checkOut=2022-01-12&adult=1&children=0&crn=1&ages=&travelpurpose=0&curr=USD&link=title&hoteluniquekey=H4sIAAAAAAAAAONay8jFK8Fo8B8GGIWYOBilpjNy3N2xvovZYAOzIwMITFno4AlmWCxxCOCZxCjFCeMJVousc394aqGDExvH8r1MEiwzGBtuP2XbyAhWoFDqsIOR6QTjQ6YFTI1A4V1MUFWHmFg5NmlKsJxiYrjExHCLieERE8MrJoZPTAy_YEqamBm6mBkmMUMUzmJmWMTMIMQKdpeUgoGJuVliqqWJsXGSgUmyibFFiqlpWpKRiWliskWqaZKFArfG3a4vfWxGYqcYhQ3NTAzMLCwtLQzNDUz0slOM8g2smKUY3TwYg9jMHR2d3dyiZLiYnf0iBcGOZvhgL8UcGuyieCbW-wR7raRDEmtqnm5ocMYljgLGLkY2AUYPxgjGVYwMAPO4G-c-AQAA", thirdparty: "trip.com", rating: "4.8")
  first_sanya_place.photos.attach(io: first_sanya_place_image_one, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  first_sanya_place.photos.attach(io: first_sanya_place_image_two, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  first_sanya_place.photos.attach(io: first_sanya_place_image_three, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  first_sanya_place.save!

  # 2. Houhai Airbnb
  second_sanya_place_image_one = URI.open('https://z1.muscache.cn/im/pictures/miso/Hosting-40930487/original/f695bfaf-f7e0-4580-8e5d-1af1aca472cd.jpeg?im_w=1200')
  second_sanya_place_image_two = URI.open('https://z1.muscache.cn/im/pictures/miso/Hosting-40930487/original/91efed73-cb54-41e5-83b3-ee23f580436a.jpeg?im_w=1440')
  second_sanya_place_image_three = URI.open('https://z1.muscache.cn/im/pictures/27f47222-af9e-4f94-ad0f-b49a013eb7e1.jpg?im_w=1440')
  second_sanya_place = Place.new(user: first_user, city_name: "Sanya", place_name: "Houhai Village Hidden Sea View Queen Bed Room", description: "Our guesthouse is located on the national coast in the Begong Bay area, by the beach, you can stroll out of the house and share a sea surf spot with Centipede Island", price_by_night: 648, view: "beach view", available: true,max_guest: 6, number_bathrooms: 2, address:"Sanya, Hainan, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://www.airbnb.com/rooms/40930487?federated_search_id=efb77d56-b73b-499b-a36b-e16b9c876271&source_impression_id=p3_1641875239_ZQY69HDGZP9l1E4n", thirdparty: "airbnb", rating: "4.8")
  second_sanya_place.photos.attach(io: second_sanya_place_image_one, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  second_sanya_place.photos.attach(io: second_sanya_place_image_two, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  second_sanya_place.photos.attach(io: second_sanya_place_image_three, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  second_sanya_place.save!

  # 3. qunar sanya
  third_sanya_place_image_one = URI.open('https://himg1.qunarzz.com/imgs/202106/01/C.awmrM-9aZ6iRDa7EZ480s.jpg')
  third_sanya_place_image_two = URI.open('http://ugcimg.qunarzz.com/imgs/202111/23/gvGt76vhuRYkGk3Ug1024.jpg')
  third_sanya_place_image_three = URI.open('http://ugcimg.qunarzz.com/imgs/202111/23/gvGt76vhuRYV4R4lg1024.jpg')
  third_sanya_place = Place.new(user: first_user, city_name: "Sanya", place_name: "Pheonix Sanya", description: "Located on Pheonix island", price_by_night: 648, view: "beach view", available: true,max_guest: 6, number_bathrooms: 2, address:"Sanya, Hainan, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://hotel.qunar.com/cn/sanya/dt-32545/?fromDate=2022-01-15&toDate=2022-01-16&highQuality=false&bellaId=RlPa11gwJgy05N8ZcEWN-", thirdparty: "qunar", rating: "4.8")
  third_sanya_place.photos.attach(io: third_sanya_place_image_one, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  third_sanya_place.photos.attach(io: third_sanya_place_image_two, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  third_sanya_place.photos.attach(io: third_sanya_place_image_three, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  third_sanya_place.save!

  # 4. hostelworld sanya
  fourth_sanya_place_image_one = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/5/5666/1.jpg')
  fourth_sanya_place_image_two = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/5/5666/tkpo8owr2jujeocdjdzw')
  fourth_sanya_place_image_three = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/5/5666/wiq5tcvnmpkf1bnoniiw')
  fourth_sanya_place = Place.new(user: first_user, city_name: "Sanya", place_name: "Sanya Blue Sky International Youth Hostel", description: "Blue Sky Hostel is 150 meters from the great beach of Dadonghai Bay", price_by_night: 648, view: "beach view", available: true,max_guest: 6, number_bathrooms: 2, address:"Sanya, Hainan, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://hotel.qunar.com/cn/sanya/dt-32545/?fromDate=2022-01-15&toDate=2022-01-16&highQuality=false&bellaId=RlPa11gwJgy05N8ZcEWN-", thirdparty: "hostelworld", rating: "4.8")
  fourth_sanya_place.photos.attach(io: fourth_sanya_place_image_one, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  fourth_sanya_place.photos.attach(io: fourth_sanya_place_image_two, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  fourth_sanya_place.photos.attach(io: fourth_sanya_place_image_three, filename: 'sanya.jpeg', content_type: 'image/jpeg')
  fourth_sanya_place.save!

  #  Chengdu

  # 2. chengdu Airbnb
  second_chengdu_place_image_one = URI.open('https://z1.muscache.cn/im/pictures/miso/Hosting-52510967/original/1b681731-442c-4806-8737-b8fc1b230734.jpeg?im_w=1200')
  second_chengdu_place_image_two = URI.open('https://z1.muscache.cn/im/pictures/miso/Hosting-52510967/original/5d7cffcb-701e-42b5-beaf-df727e5a484d.jpeg?im_w=1200')
  second_chengdu_place_image_three = URI.open('https://z1.muscache.cn/im/pictures/miso/Hosting-52510967/original/a00b2842-060d-4a5d-9962-f9f56266ef22.jpeg?im_w=1440')
  second_chengdu_place = Place.new(user: first_user, city_name: "Chengdu", place_name: "170 ㎡ 4BR Big terrace", description: "The neighborhood is 100 meters away from Taikoo Li, the first line is near the Jinjiang River, and it is very convenient to go to all the major scenic spots in the city.", price_by_night: 666, view: "city view", available: true,max_guest: 6, number_bathrooms: 2, address:"Taikoo Li, Chengdu, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://www.airbnb.com/rooms/52510967?federated_search_id=33bda36f-487f-4825-9f97-1dd5afe31e7b&source_impression_id=p3_1641884315_nExKJYzKwKZN4i7t&guests=1&adults=1", thirdparty: "airbnb", rating: "4.8")
  second_chengdu_place.photos.attach(io: second_chengdu_place_image_one, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  second_chengdu_place.photos.attach(io: second_chengdu_place_image_two, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  second_chengdu_place.photos.attach(io: second_chengdu_place_image_three, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  second_chengdu_place.save!

  # 3. qunar chengdu
  third_chengdu_place_image_one = URI.open('https://himg1.qunarzz.com/imgs/202102/24/C.ek60vx50k8SFYHH1c480s.jpg')
  third_chengdu_place_image_two = URI.open('https://himg1.qunarzz.com/imgs/201911/05/C.N85cmSwyJEGek4MCo120.jpg')
  third_chengdu_place_image_three = URI.open('https://himg1.qunarzz.com/imgs/201705/06/C._M0DCicZQva2Wl-yi120.jpg')
  third_chengdu_place = Place.new(user: first_user, city_name: "Chengdu", place_name: "St. Regis Chengdu", description: "Downtown Chengdu", price_by_night: 1087, view: "city view", available: true,max_guest: 6, number_bathrooms: 2, address:"Chengdu, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://hotel.qunar.com/cn/chengdu/dt-7168/?fromDate=2022-01-15&toDate=2022-01-16&highQuality=true&bellaId=B125XILYeN_XLvRubujrD", thirdparty: "qunar", rating: "4.8")
  third_chengdu_place.photos.attach(io: third_chengdu_place_image_one, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  third_chengdu_place.photos.attach(io: third_chengdu_place_image_two, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  third_chengdu_place.photos.attach(io: third_chengdu_place_image_three, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  third_chengdu_place.save!

  # 4. hostelworld chengdu
  fourth_chengdu_place_image_one = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/1/12881/ouhixx8g7cxecukumroa')
  fourth_chengdu_place_image_two = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/1/12881/eifa0q8i9einu9bcjamo')
  fourth_chengdu_place_image_three = URI.open('https://a.hwstatic.com/image/upload/f_auto,q_auto,w_1900,h_823,c_limit,e_sharpen,e_improve,e_vibrance:60/v1/propertyimages/1/12881/ogaiafcgsmjp8azgh4iu')
  fourth_chengdu_place = Place.new(user: first_user, city_name: "Chengdu", place_name: "Chengdu Dreams Travel International Youth Hostel", description: "It's very easy find us in chengdu,All the people in Chengdu Know Wuhou temple, Find the temple, Find us.", price_by_night: 276, view: "downtown", available: true,max_guest: 6, number_bathrooms: 2, address:"Wuhou Temple, Chengdu, China",number_rooms: 4, amenities: "washer and dryer, towel rack, hot tub", link: "https://www.hostelworld.com/pwa/hosteldetails.php/Chengdu-Dreams-Travel-International-Youth-Hostel/Chengdu/12881?from=2022-01-12&to=2022-01-15&guests=2", thirdparty: "hostelworld", rating: "4.8")
  fourth_chengdu_place.photos.attach(io: fourth_chengdu_place_image_one, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  fourth_chengdu_place.photos.attach(io: fourth_chengdu_place_image_two, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  fourth_chengdu_place.photos.attach(io: fourth_chengdu_place_image_three, filename: 'chengdu.jpeg', content_type: 'image/jpeg')
  fourth_chengdu_place.save!

puts "Done with hard coded places"

# csv = Rails.root.join('db', 'places.csv')
csv = "#{Rails.root}/db/places.csv"

user = User.first
# Aggy: need to create a user to create places
# User.destroy_all # This is commented out, because you already have a user in your database (local AND heroku)
# user = User.create(email: 'blablabla3@test.com', password: '123456789', name: "Test Test") # Aggy: will just use this new user to create all the places below

CSV.foreach(csv, headers: true, col_sep: "|") do |row|
     place = Place.new(
        link: row["link"],
        place_name: row["place_name"],
        city_name: row["city_name"],
        price_by_night: row["price_by_night"],
        rating: row["rating"],
        address: row["address"],
        # image: row["images"],
        amenities: row["amenities"],
        description: row["description"],
        thirdparty: row["thirdparty"],
        user_id: user.id # Aggy: user cannot be blank, validation!
    )

    images = []
    if row["images"].present?
      images = row["images"].gsub("[","").gsub("]","").split(",").map{|x| x.gsub('"','').strip}
      puts "check images array"
      p images

      # Aggy: to avoid running into errors, best to just loop through the images array
      images.each do |image|
        place.photos.attach(io: URI.open(image), filename: "#{SecureRandom.hex(4)}.jpg")
      end
    end


    # Aggy: Comment out below, I can't test it because I dont have the CLOUDINARY key
     # place.photos.attach(io: URI.open(images[0]), filename: "hotel.jpg")
     # place.photos.attach(io: URI.open(images[1]), filename: "hotel.jpg")
     # place.photos.attach(io: URI.open(images[2]), filename: "hotel.jpg")

    # finally
    if place.save
      puts "place saved!"
    else
      puts "error #{place.errors.full_messages}"
    end
end

# p Scrape
# scrape = Scrape.new
# p scrape.trip_scraper

# puts "Cleaning database..."
# Place.destroy_all
# puts "Creating places..."
# require "open-uri"
# first_user = User.first
