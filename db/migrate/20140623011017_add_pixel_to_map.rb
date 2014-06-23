class AddPixelToMap < ActiveRecord::Migration
  def change
    add_column :maps, :pixel_size, :decimal
  end
end
