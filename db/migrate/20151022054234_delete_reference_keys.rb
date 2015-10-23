class DeleteReferenceKeys < ActiveRecord::Migration
  def change
    remove_column :books, :book_id, :integer
	 remove_column :users, :user_id, :integer
  end
end
