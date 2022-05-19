# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing Database..."

Plant.destroy_all
Purchase.destroy_all
Cart.destroy_all
User.destroy_all
Charge.destroy_all

puts "Creating a new database..."

# scraping a plants website for their top 10 plans and storing titles, descriptions and image urls in arrays
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

images = []
html_doc.search('.std-product-details > .image a img').each do |element|
  images << "https://www.hedgesdirect.co.uk/acatalog/#{element.attr('data-src')}"
end

# create two users so that we can link them with our plants
first_user_hash = { first_name: "Alfonso", email: "test@test.test", address: "10 Downing St, London", password: "123456" }
second_user_hash = { first_name: "Galadriel", email: "test1@test.test", address: "138 Kingsland Rd, London", password: "654321" }
first_user_image = URI.open("https://images.unsplash.com/photo-1485528562718-2ae1c8419ae2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1116&q=80")
second_user_image = URI.open("https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80")

user_one = User.new(first_user_hash)
user_one.photo.attach(io: first_user_image, filename: 'user1.png', content_type: 'image/png')
user_one.save!
sleep(1)
user_two = User.new(second_user_hash)
user_two.photo.attach(io: second_user_image, filename: 'user2.png', content_type: 'image/png')
user_two.save!

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
  attributes[:price_per_clipping] = rand(5.00..10.99).round(2)
  attributes[:number_of_clippings] = rand(1..15)

  plant = Plant.new(attributes)
  plant.user = users.sample

  # attaching photo to plant
  file = URI.open(images[0])
  plant.photos.attach(io: file, filename: 'plant.png', content_type: 'image/png')
  plant.save!

  titles.delete_at(0)
  descriptions.delete_at(0)
  images.delete_at(0)
end

i = 0
Plant.all.each do |plant|
  plant.photos.attach(io: File.open("app/assets/images/seed_plant_#{i}.jpg"), filename: "plant#{i}.jpg", content_type: 'image/jpg')
  i += 1
  plant.save!
end

puts "Done! #{Plant.count} plants and #{User.count} users created!"
