class Location < ActiveRecord::Base
  has_many :users
  has_many :companies

  validates :address, presence: true, length: { maximum: 255 }
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
  geocoded_by :address
  reverse_geocoded_by :location_latitude, :location_longitude
end
