class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer, null: false, default: 2
  end
end
