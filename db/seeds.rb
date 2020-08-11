# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'open-uri'
require 'nokogiri'

chevreuse = Venue.create(name: "Chevreuse")

department = 'yvelines'
url = "https://www.google.com/search?q=#{department}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.vk_c gws-trips__outer-card g').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end

# COUNTRIES = ['France'] # => Add Countries
# DEPARTMENTS = ['Yvelines', 'Parc', 'Plage', 'Monument'] # => Add Categories
# CITIES.each do |city|
#   puts "Fetching: #{city}"
#   CATEGORIES.each do |category|
#     puts "-- Category: #{category}"
#     response = RestClient.get "https://api.foursquare.com/v2/venues/search?near=#{city},France&client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&v=20202005&query=#{category}&locale=fr&limit=5"
#     data = JSON.parse(response)
#     data["response"]["venues"].each do |item|
#       if item['categories'].any?
#         venue = Venue.new(
#           name: item['name'],
#           latitude: item['location']['lat'],
#           longitude: item['location']['lng'],
#           zip: item['location']['postalCode'],
#           category: item['categories'].first['name'],
#           address: item['location']['formattedAddress'][0]
#         )
