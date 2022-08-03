class BuyController < ApplicationController
  before_action :authenticate_user!
  def index
    @shopping_address = ShoppingAddress.new
    @product = Product.find(params[:product_id])
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

  def buy_params
    params.require(:shopping_address).permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
