class Place < ApplicationRecord
  has_many :bookings
  has_many :wishlists, dependent: :destroy
  belongs_to :user
<<<<<<< HEAD

=======
>>>>>>> 64163bf57ba1cf56d45acd87aaf678bf1b79c149
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
