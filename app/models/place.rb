class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, dependent: :destroy
  belongs_to :user

  has_many_attached :photos
  geocoded_by :city_name
  after_validation :geocode, if: :will_save_change_to_address?
end
