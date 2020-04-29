class UsersController < ApplicationController
	# deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
	before_action :authenticate_user!

	#def create
	 # @book = Book.new(book_params)
	  ##
	  #	flash[:notice] ="You have creatad book successfully."
	  #	redirect_to root_path   #修正
	  #else
	  #	render 'books/index'
	  #end
	#end


	def index
	  @users = User.all
	  @user = current_user #エラー要因
	  @book = Book.new
	end



	def show
	  @user = User.find(params[:id])
	  @book = Book.new
	  #ログイン時のみ
	  #flash[:notice] ="Welcome! You have signed up successfully."
	end

	def edit
	  @user = User.find(params[:id])
	end


	def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)   #ストロングパラメータ
	  	flash[:notice] = "You have updated user successfully."
	  	redirect_to user_path(@user) #修正
	  else
	  	render 'edit'
	  end
	end

	def destroy
	  @user = User.find(params[:id])
	  @user.destroy

	end


	private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)   #追加した
	end

	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
