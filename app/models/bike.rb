class Bike < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :category, :size, :price, :location, :picture, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :picture

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_location_category_and_size,
                  against: %i[location category size],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
