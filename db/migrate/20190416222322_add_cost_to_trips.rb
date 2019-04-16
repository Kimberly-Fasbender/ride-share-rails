class AddCostToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :cost, :float
  end
end
