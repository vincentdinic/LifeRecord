class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.date :due_date
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
