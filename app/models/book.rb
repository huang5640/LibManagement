class Book < ActiveRecord::Base
	belongs_to :user

	def checkOut(user, book)
		book.user = user
	end
end
