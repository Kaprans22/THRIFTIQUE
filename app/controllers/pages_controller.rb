class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
  end
  def index
    @products = Product.all
  end

  def dashboard
    @user         = current_user
    @items        = @user.products
    @transactions = @user.transactions
  end
end
