class Location < ActiveRecord::Base
  has_many :users
  has_many :companies

  validates :address, presence: true, length: { maximum: 255 }
end
