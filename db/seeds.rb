# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

categories = %w(mountain city road track hyrbid childrens cruiser e-bike)
sizes = %w(extra-small small medium large extra-large)

puts "Destroying bikes"
Bike.destroy_all
puts "Creating new bikes"

10.times do
  bike = Bike.create!(
    name: Faker::Hipster.words(number: 1),
    category: categories.sample.to_s,
    size: sizes.sample.to_s,
    price: rand(10..50),
    location: Faker::Address.full_address,
    user_id: 1,
    picture: "bike.jpg"
    )
puts "Creating #{bike.name}"
end

puts 'seeding complete'
