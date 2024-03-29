class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @transaction = Transaction.find(params[:id])
    @product     = @transaction.product
    @user        = @transaction.user
    @address     = @transaction.user.address

    @address_marker = [
      {
        lat: @user.latitude,
        lng: @user.longitude
      }
    ]
  end

  def create
    @transaction         = Transaction.new
    @transaction.user    = current_user
    @transaction.product = Product.find(params[:product_id])
    if @transaction.save
      redirect_to transaction_path(@transaction)
    else
      render :new
    end
  end
end
