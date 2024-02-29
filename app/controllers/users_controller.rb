class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to dashboard_path(@user), notice: 'User information was updated'
    else
      render :edit
    end
  end

  def dashboard
    @user = current_user
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
    params.require(:user).permit(:photo, :first_name, :last_name, :address)
  end

end
