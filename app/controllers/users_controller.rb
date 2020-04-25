class UsersController < ApplicationController
	# deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
	before_action :authenticate_user!

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
	  @user = current_user
	  @book = Book.new

	end

	def show
	  @users = User.all
	  @user = User.find(params[:id])
	  @book = Book.new
	end

	def edit
	  @user = User.find(params[:id])
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end



end
