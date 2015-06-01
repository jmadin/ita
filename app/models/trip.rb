class Trip < ActiveRecord::Base

  has_many :maps

  validates :trip_name, :presence => true

  has_and_belongs_to_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users, :reject_if => :all_blank, :allow_destroy => true

  default_scope -> { order('start_date ASC') }

end
