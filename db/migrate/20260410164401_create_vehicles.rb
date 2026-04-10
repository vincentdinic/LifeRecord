class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.references :family, null: false, foreign_key: true
      t.string :nickname
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year
      t.string :vin
      t.string :vehicle_type, null: false
      t.string :color
      t.string :license_plate
      t.string :fuel_type
      t.date :purchase_date
      t.decimal :purchase_price, precision: 10, scale: 2
      t.decimal :current_value, precision: 10, scale: 2
      t.timestamps
    end
  end
end
