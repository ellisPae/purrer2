class AddIndextoUserDob < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :dob
  end
end
