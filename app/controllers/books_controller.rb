class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
    @book = Book.new
  end

  def new

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	flash[:success]='book was successfully created.'
  	redirect_to book_path(book.id)
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	flash[:success]='book was successfully created.'
  	redirect_to book_path(book.id)
  end

  def destroy
    book= Book.find(params[:id])
    book.destroy
    redirect_to books_path, flash: {alert: "book was successfully destroyed."}
  end
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
