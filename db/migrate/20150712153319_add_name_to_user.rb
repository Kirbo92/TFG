class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, limit: 80, null: false
  end
end
