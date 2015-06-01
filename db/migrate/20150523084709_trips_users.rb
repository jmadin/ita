class TripsUsers < ActiveRecord::Migration
  def change
    create_table :trips_users, id: false do |t|
      t.belongs_to :trip
      t.belongs_to :user
    end
  end
end
