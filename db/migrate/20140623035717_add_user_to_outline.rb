class AddUserToOutline < ActiveRecord::Migration
  def change
    add_reference :outlines, :user, index: true
  end
end
