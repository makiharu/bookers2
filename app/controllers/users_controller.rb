class UsersController < ApplicationController
	# deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
	before_action :authenticate_user!

 	#投稿に紐づいているユーザと現在ログインしているユーザーが異なるかどうかをチェック
    before_action :correct_user, only: [:edit, :update]

	def index
	  @users = User.all
	  @user = current_user #エラー要因
	  @book = Book.new
	end



	def show
	  @user = User.find(params[:id])
	  @book = Book.new
	end

	def edit
	  @user = User.find(params[:id])
	end



	def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
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
		params.require(:book).permit(:title, :body)
	end

	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end


	def correct_user
      user = User.find(params[:id])
      if current_user != user
      redirect_to user_path(current_user) #追記
	  end
    end


end
