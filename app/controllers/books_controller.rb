class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :checkIn, :checkOut]

	def index 
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def show
    @user = @book.user 
	end

	def edit

	end

  def checkIn
  end

  def checkOut
    @user = User.where(:user_id, params[:user_id])
  end

	def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
	end

    def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :ISBN, :user_id)
    end
end
