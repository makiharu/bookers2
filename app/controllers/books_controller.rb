class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show]

	def index
	  @books = Book.all
	  @book = Book.new
	  #@user = current_user #エラー要員
	end

	def create
	  @books = Book.all.order(id: :DESC)  #チェック
	  @book = Book.new(book_params)
	  @book.user_id = current_user.id
	  if @book.save
	  	flash[:notice] = "You have creatad book successfully."
	    redirect_to book_path(@book.id)
	  else
	  	render 'index'
	  end
	end

	def show
	  @onebook = Book.find(params[:id])  #@bookと違う変数名を用意
	  #@books = Book.all
	  @book = Book.new
	  #user定義,本に紐づいたユーザー
	  @user = User.find(@onebook.user_id)
	end

	def edit
	  @book = Book.find(params[:id])
	end



	def destroy
		@book = Book.find(params[:id])
		redirect_to books_path
	end

	private
	  def book_params
	  	params.require(:book).permit(:title, :body)
	  end
	  	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
