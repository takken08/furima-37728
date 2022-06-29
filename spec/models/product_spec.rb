require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it "item_name,explanation,category_id,item_state_id,delivery_charge_id,area_id,delivery_day_id,selling_priceが存在すれば出品できる" do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it "imageが空だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと出品できない" do
        @product.item_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_nameが40文字以上だと出品できない" do
        @product.item_name = "a" * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Item name please enter within 40 characters")
      end
      it "explanationが空だと出品できない" do
        @product.explanation = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "explanationが1000文字以上だと出品できない" do
        @product.explanation = "a" * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation please enter within 1000 characters")
      end
      it "category_idが1だと出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "item_state_idが1だと出品できない" do
        @product.item_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Item state can't be blank")
      end
      it "delivery_charge_idが1だと出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "area_idが1だと出品できない" do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it "delivery_day_idが1だと出品できない" do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "selling_priceが空だと出品できない" do
        @product.selling_price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price can't be blank")
      end
      it "selling_priceが半角数字で入力しないと出品できない" do
        @product.selling_price = "１２３４５"
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price please enter the price from 300 yen to 9,999,999 yen")
      end
    end
  end
end
