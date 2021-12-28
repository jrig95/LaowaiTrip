class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, through: :users
end
