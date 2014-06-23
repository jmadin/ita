class AddMapCodeToMap < ActiveRecord::Migration
  def change
    add_column :maps, :map_code, :string
  end
end
