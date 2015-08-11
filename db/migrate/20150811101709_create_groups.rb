class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :tag, limit: 30, null: false
      t.string :name, limit: 40, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
