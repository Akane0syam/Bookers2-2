class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  def create
     @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render :show
    end
  end

  def show
    @book = Book.find(params[:id])
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
