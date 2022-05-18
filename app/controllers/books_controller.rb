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
      @user = current_user
      @users = User.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])

    @users = User.all
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    if @user = current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
       render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books', notice: "Book was successfully destroyed."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to example_path
   end
  end

end
