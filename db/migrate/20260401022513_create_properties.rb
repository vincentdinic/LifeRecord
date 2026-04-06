class CreateProperties < ActiveRecord::Migration[8.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.text :description

      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :country, null: false, default: "United States"
      t.string :unit

      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
