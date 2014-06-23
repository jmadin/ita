class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.references :map, index: true
      t.string :substrate_type
      t.string :substrate_state
      t.string :outline_filename
      t.string :outliner_name
      t.string :outline_flag
      t.decimal :outline_area
      t.decimal :outline_perimeter
      t.text :outline_notes

      t.timestamps
    end
  end
end
