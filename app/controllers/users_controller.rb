class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end
  def dashboard
    @user = User.find(params[:id])
  end
end
