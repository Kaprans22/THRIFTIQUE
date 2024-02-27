class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update edit destroy]
  def index
    @products = Product.all
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
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, notice: 'Product was not created.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
