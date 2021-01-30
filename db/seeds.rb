# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

categories = %w(mountain city road track hyrbid childrens cruiser e-bike)
sizes = %w(extra-small small medium large extra-large)
bike_names = ["Fixie", "Mountain bike", "Dutch style city bike", "Great to toddlers", "Extreme Mountain Bike", "Vintage 10 speed bike", "Hybrid bike", "E-Bike", "City Cruiser", "Campagnolo", "Colnago"]
picture_array = [ "https://images.unsplash.com/photo-1584646270728-a7d853d78d67?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1598&q=80",
  "https://images.unsplash.com/photo-1553788195-e0fd80c655d2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1582732142755-c575e698599d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1632&q=80",
  "https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2103&q=80",
  "https://images.unsplash.com/photo-1586684075772-746ed499fbf1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1505705694340-019e1e335916?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2089&q=80",
  "https://images.unsplash.com/photo-1560203452-a76df38ba8fc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2090&q=80",
  "https://images.unsplash.com/photo-1549216963-72c1712c1196?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1559348349-86f1f65817fe?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
  "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1650&q=80"
]
locations = %w(Berlin Hamburg London Lisbon Paris)

puts "Destroying bikes"
Bike.destroy_all

puts "Creating bikes"

count = 0

10.times do
  file = URI.open(picture_array[count])
  bike = Bike.new(
    name: bike_names.sample.to_s,
    category: categories.sample.to_s,
    size: sizes.sample.to_s,
    price: rand(10..50),
    description: Faker::Movies::Ghostbusters.quote,
    location: locations.sample.to_s,
    user_id: 1,
    )
  bike.picture.attach(io: file, filename: "file.png", content_type: "image/png")
  bike.save
  count =+ 1
  puts "Creating #{bike.name}"
end

puts "Seeding complete"
