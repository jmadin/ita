class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :location_code
      t.decimal :latitude
      t.decimal :longitude
      t.text :location_notes

      t.timestamps null: false
    end
  end
end
