class ChangeLocationidToMap < ActiveRecord::Migration
  def change
    rename_column :maps, :location_id_id, :location_id
    rename_column :maps, :trip_id_id, :trip_id
  end
end
