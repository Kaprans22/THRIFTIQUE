class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path(@user), notice: 'Profile picture was updated'
    else
      render :edit
    end
  end

  def create
    if @user.save
      redirect_to @user
    else
      Rails.logger.info @user.errors.full_messages.join(", ")
      render :new, status: 422
    end
  end

  def dashboard
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
