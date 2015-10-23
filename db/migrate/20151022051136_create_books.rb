class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.integer :ISBN
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :books, :user_id
  end
end
