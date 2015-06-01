class AddLocationidToMap < ActiveRecord::Migration
  def change
    add_reference :maps, :location_id, index: true, foreign_key: true
  end
end
