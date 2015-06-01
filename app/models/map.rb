class Map < ActiveRecord::Base

  belongs_to :location
  belongs_to :trip

  has_many :outlines, :dependent => :destroy
  validates :map_name, :presence => true

  default_scope -> { order('map_date ASC') }

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

end
