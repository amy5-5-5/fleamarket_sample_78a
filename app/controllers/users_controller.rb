class UsersController < ApplicationController

  # before_action :authenticate_user!, only: [:mypage]

  def show
    # @nickname = current_user.nickname
    # @user = User.where(user_id: current_user.id)
  end

  def edit
  end

  def logout
  end

  def creditcard
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  #以下、自信ないです
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
