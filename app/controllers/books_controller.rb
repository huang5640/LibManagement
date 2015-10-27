class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :destroy, :checkIn, :checkOut, :checkingOut]
  before_action :set_user, only: [:checkOut, :checkingOut]
  helper :all

	def index 
		if params[:keyword]
      @books = Book.search(params[:keyword])
    elsif params[:isbn]
      @books = Book.search_by_isbn(params[:isbn])
    end
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
    @book.update(:user_id => nil)

    flash[:notice] = "图书已经归库"
    redirect_to books_path
  end

  def checkingOut
    @book.update(:user_id => @user.id)
    flash[:notice] = "图书已经借出"
    redirect_to books_path
  end

  def checkOut
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

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_user
      @user = User.find_by(YiBoID: params[:YiBoID])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :ISBN, :user_id)
    end
end
