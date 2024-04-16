class CreatePostMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :post_members do |t|
      t.references :post,   null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
