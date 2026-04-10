class CreateEducationRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :education_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :school_name, null: false
      t.string :field_of_study
      t.string :degree_type, null: false
      t.string :city
      t.string :state
      t.string :country
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :current, null: false, default: false
      t.decimal :gpa, precision: 3, scale: 2

      t.timestamps
    end
  end
end
