class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :institution, :string
  end
end
