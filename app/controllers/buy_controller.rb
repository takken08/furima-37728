class BuyController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params_id, only: [:index, :create]

  def index
    @shopping_address = ShoppingAddress.new
  end

  def create
    @shopping_address = ShoppingAddress.new(buy_params)
    if @shopping_address.valid?
      @shopping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_params_id
    @product = Product.find(params[:product_id])
  end

end
