class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :handle, :string
    add_column :users, :phone_number, :string
    add_column :users, :dob, :string, null: false
    add_column :users, :bio, :text

    add_index :users, :dob
    add_index :users, :handle, unique: true
  end
end
