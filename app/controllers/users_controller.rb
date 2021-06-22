class UsersController < ApplicationController
  def index
     @book = Book.new
     @user = current_user
     @users = User.all
     #@users = Book.find(user_id)
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @userbook = @user.books.page(params[:page]).reverse_order
  end
  
  def create
  end
  
  def edit
    @user = User.find(params[:id])
    @user.id == current_user
     redirect_to user_path
     end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id) 
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
end
