class AddTripToMap < ActiveRecord::Migration
  def change
    add_reference :maps, :trip_id, index: true, foreign_key: true
  end
end
