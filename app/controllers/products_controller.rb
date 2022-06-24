class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price)
  end

end
