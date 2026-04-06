class CreateDocuments < ActiveRecord::Migration[8.1]
  def change
    create_table :documents do |t|
      t.references :documentable, polymorphic: true, null: false
      t.references :uploaded_by, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.text :description
      t.string :document_type, null: false
      t.timestamps
    end
  end
end
