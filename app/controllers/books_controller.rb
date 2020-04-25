class BooksController < ApplicationController
before_action :authenticate_user!, only: [:index, :show]

	def index
	  @books = Book.all
	  @book = Book.new
	end

	def create
	  @books = Book.all
	  @book = Book.new(book_params)
	  @book.user_id = current_user.id
	  if @book.save
	    redirect_to book_path(@book.id)
	  else
	  	render 'index'
	  end
	end

	def show
	  @book = Book.find(params[:id])
	  @books = Book.all
	  @book= Book.new
	  #user定義,本に紐づいたユーザー
	  @user = @book.user_id
	end

	def edit
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	  def book_params
	  	params.require(:book).permit(:title, :body, :user_id)
	  end

end