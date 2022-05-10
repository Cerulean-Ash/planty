# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing Database..."

Plant.destroy_all
User.destroy_all

puts "Creating a new database..."

# scraping a plants website for their top 10 plans and storing titles and descriptions in arrays
url = "https://www.hedgesdirect.co.uk/acatalog/Top-Selling-Hedging-Plants.html"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

descriptions = []
html_doc.search('.shortDesc').each do |element|
  descriptions << element.text.strip
end

titles = []
html_doc.search('.standardSearchText.details h2').each do |element|
  titles << element.text.strip
end

# create two users so that we can link them with our plants
first_user_hash = { first_name: "Alf", email: "test@test.test", address: "21B Baker Street, London", password: "123456" }
second_user_hash = { first_name: "Garfield", email: "test1@test.test", address: "138 Kingsland Rd, London", password: "654321" }

user_one = User.create!(first_user_hash)
user_two = User.create!(second_user_hash)

users = [user_one, user_two]

# care type array
care_array = %w[Easy Medium Hard]

10.times do
  attributes = {}
  attributes[:title] = titles[0]
  attributes[:description] = descriptions[0]

  # setting a random care type 1-5
  attributes[:care_type] = care_array.sample

  # getting a random color from a color api
  color_api_url = "https://www.thecolorapi.com/random"
  color = JSON.parse(URI.open(color_api_url).read)['name']['value']
  attributes[:color] = color

  # getting a random price_per_clipping and number of clippings
  attributes[:price_per_clipping] = rand(5.00..55.99).round(2)
  attributes[:number_of_clippings] = rand(1..15)

  plant = Plant.new(attributes)
  plant.user = users.sample
  plant.save

  titles.delete_at(0)
  descriptions.delete_at(0)
end

puts "Done! #{Plant.count} plants and #{User.count} users created!"
