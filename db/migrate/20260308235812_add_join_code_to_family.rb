class AddJoinCodeToFamily < ActiveRecord::Migration[8.1]
  def change
    add_column :families, :join_code, :string
    add_index :families, :join_code, unique: true
  end
end
