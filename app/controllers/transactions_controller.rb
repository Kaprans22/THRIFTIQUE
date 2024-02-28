class TransactionsController < ApplicationController
  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
  end

  def create
  end
end
