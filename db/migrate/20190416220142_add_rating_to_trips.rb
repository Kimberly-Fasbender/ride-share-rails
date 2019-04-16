class AddRatingToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :rating, :integer, :default => nil
  end
end
