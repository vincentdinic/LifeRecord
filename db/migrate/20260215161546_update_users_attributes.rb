class UpdateUsersAttributes < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string, null: false
    add_column :users, :birthday, :date, null: false
  end
end
