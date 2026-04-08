class CreateEmploymentRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :employment_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company_name, null: false
      t.string :role, null: false
      t.string :department
      t.string :city
      t.string :state
      t.string :country
      t.string :location_type, null: false
      t.string :employment_type, null: false
      t.string :employment_status, null: false
      t.string :salary_type
      t.decimal :salary, precision: 10, scale: 2
      t.string :pay_day
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :current, null: false, default: false
      t.timestamps
    end
  end
end
