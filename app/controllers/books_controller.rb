class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user.id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
