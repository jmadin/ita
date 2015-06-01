class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.datetime :start_date
      t.datetime :end_date
      t.text :trip_notes

      t.timestamps null: false
    end
  end
end
