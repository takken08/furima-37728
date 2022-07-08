class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
     @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
