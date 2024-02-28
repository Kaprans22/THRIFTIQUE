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
<<<<<<< HEAD
    @product = Product.new(product_params)
    @product.user = current_user
=======
    @product = current_user.products.new(product_params)

>>>>>>> master
    if @product.save
      redirect_to @product
    else
      Rails.logger.info @product.errors.full_messages.join(", ")
      render :new, status: 422
    end
  end
  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :size)
  end
  def set_product
    @product = Product.find(params[:id])
  end
end
