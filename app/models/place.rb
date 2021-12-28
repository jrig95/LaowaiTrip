class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists
  belongs_to :user
end
