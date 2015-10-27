module BooksHelper
	def CheckOutForUser (user, book)
		book.user = user
	end
end
