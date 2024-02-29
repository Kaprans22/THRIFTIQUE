class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @transaction = Transaction.find(params[:id])
    @product     = @transaction.product
    @user        = @transaction.user

    # @pick_up_points = PickUpPoint.all
    # The `geocoded` scope filters only flats with coordinates
    file_path = Rails.root.join('public', 'pickupPoints.json')
    if File.exist?(file_path)
      json_data = File.read(file_path)
      if json_data.present?
        markers = "---------------- READ THIS --------------#{JSON.parse(json_data)}"
        puts "---------------- READ THIS --------------#{markers}"
      else
        puts "---------------- READ THIS --------------File is empty"
      end
    else
      puts "---------------- READ THIS --------------File does not exist"
    end
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
