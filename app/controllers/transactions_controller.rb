class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
    @product     = @transaction.product
    @user        = @transaction.user

    # @pick_up_points = PickUpPoint.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = []
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
