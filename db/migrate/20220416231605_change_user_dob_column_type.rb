class ChangeUserDobColumnType < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :dob, :date
    add_column :users, :dob, :date, null: false
    add_index :users, :dob
  end
end
