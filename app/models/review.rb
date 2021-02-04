class Review < ApplicationRecord
  belongs_to :bike

  validates :content, presence: true
end
