class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  end

  def new
  	@book = Book.new
  	@books = Book.all
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
    redirect_to new_book_path, flash: {alert: "book was successfully destroyed."}
  end
  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
