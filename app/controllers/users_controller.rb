class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    #現在ログインしているユーザーが他のユーザー情報を変更できないようアクセス制限をかける
   unless @user == current_user
     redirect_to user_path(current_user)
   end
  end
  
  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "ユーザーを編集しました"
     redirect_to user_path(@user)
   else
     flash.now[:alert] = "必要事項を入力してください"
     render :edit
   end
  end
 
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
