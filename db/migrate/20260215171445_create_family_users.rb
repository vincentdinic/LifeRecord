class CreateFamilyUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :family_users, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.timestamps
    end
    add_index :family_users, [ :user_id, :family_id ], unique: true
  end
end
