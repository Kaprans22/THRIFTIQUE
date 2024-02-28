class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @product = Product.find(params[:product_id])

    redirect_to transactions_id_path
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.product = Product.find(params[:product_id])
    if @transaction.save
      redirect_to user_dashboard_path(current_user)
    else
      render :new
    end
  end
end
