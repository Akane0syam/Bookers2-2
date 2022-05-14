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
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.index(user_params)
    if @user.save
      redirect_to root_path, success: 'Welcome! You have signed up successfully.'
    end
  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out successfully.'
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

end