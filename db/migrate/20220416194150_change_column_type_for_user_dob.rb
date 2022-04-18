class ChangeColumnTypeForUserDob < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :dob
    add_column :users, :dob, :date, null: false
  end
end