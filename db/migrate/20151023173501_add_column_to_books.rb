class AddColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :YiBoNum, :integer 
  end
end
