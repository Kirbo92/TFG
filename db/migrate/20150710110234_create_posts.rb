class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, limit: 140, null: false

      t.timestamps null: false
    end
  end
end
