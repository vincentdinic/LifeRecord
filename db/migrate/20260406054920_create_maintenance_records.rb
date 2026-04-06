class CreateMaintenanceRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenance_records do |t|
      t.references :maintainable, polymorphic: true, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :description
      t.date :performed_on
      t.decimal :cost, precision: 10, scale: 2
      t.string :contractor
      t.timestamps
    end
  end
end
