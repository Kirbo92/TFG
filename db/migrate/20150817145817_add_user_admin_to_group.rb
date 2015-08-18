class AddUserAdminToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :user_admin, :integer, null: false
  end
end
