class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
end
