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
bike_names = ["Fixie", "Mountain bike", "Dutch style city bike", "Great to toddlers", "Extreme Mountain Bike", "Vintage 10 speed bike", "Hybrid bike", "E-Bike", "City Cruiser"]

puts "Destroying bikes"
Bike.destroy_all

puts "Creating bikes"

10.times do
  file = URI.open("https://images.unsplash.com/photo-1596405226562-98ba0a2b3578?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1571&q=80")
  bike = Bike.new(
    name: bike_names.sample.to_s,
    category: categories.sample.to_s,
    size: sizes.sample.to_s,
    price: rand(10..50),
    location: "Berlin",
    user_id: 1,
    )
  bike.picture.attach(io: file, filename: "file.png", content_type: "image/png")
  bike.save
  puts "Creating #{bike.name}"
end

puts "Seeding complete"
