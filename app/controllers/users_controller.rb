class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def edit
     @user = User.find(params[:id])
    if @user = current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :rdit
    end
  end



  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
