class AddFieldsToProperties < ActiveRecord::Migration[8.1]
  def change
    add_column :properties, :bedrooms, :integer, null: false
    add_column :properties, :bathrooms, :decimal, precision: 3, scale: 1, null: false
    add_column :properties, :purchase_date, :date
    add_column :properties, :square_feet, :integer
    add_column :properties, :year_built, :integer
    add_column :properties, :occupancy_status, :integer, null: false, default: 0
    add_column :properties, :ownership_status, :integer, null: false, default: 0
  end
end
