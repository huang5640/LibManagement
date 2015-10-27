class Book < ActiveRecord::Base
	belongs_to :user

	scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
	scope :search_by_isbn, ->(isbn) {where('ISBN LIKE ?', "#{isbn}%") if isbn.present? }
	before_save :set_keywords

	protected
    def set_keywords
    	word = [title, author, description].map(&:downcase).join(' ')
    	#isbn = [Book.ISBN]
        self.keywords = word
    end
end
