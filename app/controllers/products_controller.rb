class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: %i[show update edit destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  SEARCH_MAPPING = {
    'streetwear' => ['stussy', 'carhartt', 'bape', 'nike'],
    'sneakers' => ['nike', 'adidas', 'jordan', 'yeezy'],
    'luxury' => ['gucci', 'louis vuitton', 'prada', 'hermes'],
  }.freeze

  def index
    search_terms = params[:search].present? ? Array(params[:search]) : []
    search_terms = search_terms.flat_map { |term| SEARCH_MAPPING[term.downcase] || term }

    if search_terms.any?
      @products = Product.where(
        search_terms.map { |term| "lower(name) LIKE ?" }.join(" OR "),
        *search_terms.map { |term| "%#{term.downcase}%" }
      )
    else
      @products = Product.none
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @transaction = Transaction.new
    @products = Product.all
  end

  def delete
    @product = Product.find(params[:id])
    @product.transactions.each do |transaction|
      transaction.destroy
    end
    if @product.destroy
      redirect_to dashboard_path, notice: 'Product was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'Product could not be deleted.'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to dashboard_path, notice: 'Product was successfully destroyed.'
    else
      redirect_to dashboard_path, alert: 'Product could not be destroyed.'
    end
  end

  def dashboard
    @items = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to @product
    else
      Rails.logger.info @product.errors.full_messages.join(", ")
      render :new, status: 422
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :size, :brand, :condition, :status, :email)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
