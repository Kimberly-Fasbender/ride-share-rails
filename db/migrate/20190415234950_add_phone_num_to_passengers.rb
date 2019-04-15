class AddPhoneNumToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :phone_num, :string
  end
end
