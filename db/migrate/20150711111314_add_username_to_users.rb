class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, limit: 20, null: false
    add_index :users, :username, unique: true
  end
end
