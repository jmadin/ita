class Location < ActiveRecord::Base

  has_many :maps
  validates :location_name, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true

  default_scope -> { order('location_name ASC') }

end
