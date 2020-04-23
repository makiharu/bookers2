class UsersController < ApplicationController
	def new
	end

	def create
	  @book = Book.new(book_params)
	  if @book.save
	  	redirect_to root_path   #修正
	  else
	  	render 'books/index'
	  end
	end


	def index
	  @users = User.all
	  @user = User.new
	  @book = Book.new
	end

	def show
	  @user = User.find(params[:id])
	end

	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

end
