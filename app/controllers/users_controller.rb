class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index

  end

  def edit
    @user = User.find[params[:id]]
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
