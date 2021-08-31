json.array! @bikes do |bike|
    json.extract! bike, :id, :name, :category, :location, :price
  end