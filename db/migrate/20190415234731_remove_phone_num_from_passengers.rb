class RemovePhoneNumFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :phone_num, :bigint
  end
end
