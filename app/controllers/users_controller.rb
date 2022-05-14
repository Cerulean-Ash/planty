class UsersController < ApplicationController

  def show
    @user = User.new
    @purchases = Purchase.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo)
  end
end
