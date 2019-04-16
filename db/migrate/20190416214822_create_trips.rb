class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :cost
      t.date :date

      t.timestamps
    end
  end
end
