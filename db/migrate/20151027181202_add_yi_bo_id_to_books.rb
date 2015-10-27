class AddYiBoIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :YiBoID, :integer
  end
end
