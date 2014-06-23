class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :map_name
      t.text :map_description
      t.date :map_date

      t.timestamps
    end
  end
end
