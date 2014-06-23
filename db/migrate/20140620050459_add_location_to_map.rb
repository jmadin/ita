class AddLocationToMap < ActiveRecord::Migration
  def change
    add_column :maps, :latitude, :decimal
    add_column :maps, :longitude, :decimal
  end
end
