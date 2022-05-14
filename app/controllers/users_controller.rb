class UsersController < ApplicationController

  def show
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo)
  end
end
