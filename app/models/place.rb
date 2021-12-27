class Place < ApplicationRecord
  has_many :wishlists
  has_many :bookings
  has_many :users
end
