class Bike < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :name, :category, :size, :price, :location, presence: true
end
