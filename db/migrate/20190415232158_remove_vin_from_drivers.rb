class RemoveVinFromDrivers < ActiveRecord::Migration[5.2]
  def change
    remove_column :drivers, :vin, :integer
  end
end
