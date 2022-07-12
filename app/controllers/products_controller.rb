class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_params_id, only: [:destroy, :edit, :update, :show]

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

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to root_path
    end
  end

  def edit
    if current_user.id != @product.user_id
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:item_name, :explanation, :category_id, :item_state_id, :delivery_charge_id, :area_id, :delivery_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def set_params_id
    @product = Product.find(params[:id])
  end

end
