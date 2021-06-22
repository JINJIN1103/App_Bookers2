class BooksController < ApplicationController
  def index
     @book = Book.new
     @user = current_user
     @books = Book.all

     #@users = Book.find(user_id)
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
   redirect_to book_path(@book)
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
  #@user = User.find(params[:id])
  #@user = current_user
  #@bookss = @books.user
  end

  def edit
    @book = Book.find(params[:id])
     unless 
    @book.user == current_user
     redirect_to books_path
     end
  end

  def update
    @user = Book.find(params[:id])
    @user.update(book_params)
    redirect_to book_path(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
