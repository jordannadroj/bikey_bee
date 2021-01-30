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
bike_names = ["Fixie", "Mountain bike", "Dutch style city bike", "Great to toddlers", "Extreme Mountain Bike", "Vintage 10 speed bike", "Hybrid bike", "E-Bike", "City Cruiser"]

puts "Destroying bikes"
Bike.destroy_all
