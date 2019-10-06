class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if (@product.save)
      redirect_to home_path
    else
      render "new"
    end
  end

  private def product_params
    params.require(:product).permit(:name, :price)
  end
end
