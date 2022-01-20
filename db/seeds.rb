require_relative 'trip_scraper'
require "open-uri"
# File = Rails.root.join("db", "trip_scraper.rb")
puts "Creating places..."

p Scrape
scrape = Scrape.new
p scrape.trip_scraper
