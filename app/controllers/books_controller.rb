class BooksController < ApplicationController

  def index
     @book = Book.new
     @books = Book.all
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id 
   @book.save
#   @books = Book.find(params[:id])
   redirect_to book_path(@book)
#   redirect_to book_path(@books.id)
  # 詳細画面へのリダイレクト方法が分からない　ルートパスを書くとルートエラーになる
  end
  
  def show
    @book = Book.find(params[:id])
  end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
