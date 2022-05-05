class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

end
