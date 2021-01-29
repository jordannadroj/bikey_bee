class Bike < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :name, :category, :size, :price, :location, :picture, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :picture
end
