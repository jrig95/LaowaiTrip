class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, dependent: :destroy
  belongs_to :user
end
