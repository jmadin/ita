class Map < ActiveRecord::Base
  has_many :outlines, :dependent => :destroy
  validates :map_name, :presence => true

end
