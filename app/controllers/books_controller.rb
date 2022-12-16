class BooksController < ApplicationController
  
  def index
    @newbook = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @user = current_user
    @newbook = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
     redirect_to book_path(@book)
   else
     @books = Book.all
     @user = current_user
     render :index
   end
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "投稿を編集に成功しました"
      redirect_to book_path(@book)
   else
      flash.now[:alert] = "必要事項を入力してください"
      render :edit
   end
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
