class AddFamilyUserRoles < ActiveRecord::Migration[8.1]
  def change
    add_column :family_users, :role, :integer, default: 0, null: false
  end
end
