class PagesController < ApplicationController
  def home
    @products = Product.all
  end
end
