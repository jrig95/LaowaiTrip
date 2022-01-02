class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
end
