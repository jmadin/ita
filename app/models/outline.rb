class Outline < ActiveRecord::Base
  belongs_to :map
  belongs_to :user

  validates :substrate_type, :presence => true
  validates :substrate_state, :presence => true
  
end
