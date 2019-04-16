class RemoveCostFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :cost, :string
  end
end
