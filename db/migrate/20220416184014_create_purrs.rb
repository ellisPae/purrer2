class CreatePurrs < ActiveRecord::Migration[7.0]
  def change
    create_table :purrs do |t| 
      t.text :content, null: false
      t.integer :user_id, null: false
      t.references :original_purr, foreign_key: { to_table: :purrs }


      t.timestamps
    end
    add_index :purrs, :user_id
  end
end
