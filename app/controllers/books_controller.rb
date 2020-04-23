class BooksController < ApplicationController


	def index
	  @books = Book.all
	  @book = Book.new
	end

	def create
	  @book = Book.new(book_params)
	  
	  if @book.save
	    redirect_to book_path(@book)
	  else
	  	render 'index'
	  end
	end

	def show
	  @book = Book.find(params[:id])
	  @books = Book.all
	  @book = Book.new

	end

	def edit
	end

	private
	  def book_params
	  	params.require(:book).permit(:title, :opinion, :user_id)
	  end

end
