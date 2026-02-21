class RecreateFamilyUsers < ActiveRecord::Migration[8.1]
  def change
    drop_table :family_users

    create_table :family_users do |t|
      t.references :family, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :family_users, [ :user_id, :family_id ], unique: true
  end
end
