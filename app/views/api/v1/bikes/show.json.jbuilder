json.extract! @bike, :id, :name, :location
json.comments @bike.reviews do |review|
  json.extract! review, :id, :content
end

# json.array! @bike do |bike|
#     json.extract! bike, :id, :name, :category, :location, :price
#   end