require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @shopping_address = FactoryBot.build(:shopping_address, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品を購入できる場合' do
      it '全て正しく入力されていれば購入できる' do
        expect(@shopping_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @shopping_address.building_name = ""
        expect(@shopping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it '郵便番号が空だと購入できない' do
        @shopping_address.post_code = ""
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角英数字でないと購入できない' do
        @shopping_address.post_code = "５３３−１４２５"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号がハイフンなしの場合購入できない' do
        @shopping_address.post_code = "1234567"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと購入できない' do
        @shopping_address.area_id = 1
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @shopping_address.municipality = ""
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できない' do
        @shopping_address.house_number = ""
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @shopping_address.phone_number = ""
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角英数字ではないと購入できない' do
        @shopping_address.phone_number = "０９０１２３４５６７８"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number is invalid. Only half-width alphanumcric characters between 10 and 11 digits can be saved.")
      end
      it 'tokenが空では購入できない' do
        @shopping_address.token = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @shopping_address.phone_number = "12345678"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number is invalid. Only half-width alphanumcric characters between 10 and 11 digits can be saved.")
      end
      it '電話番号が12桁以上では購入できない' do
        @shopping_address.phone_number = "090123456789"
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number is invalid. Only half-width alphanumcric characters between 10 and 11 digits can be saved.")
      end
      it 'userが紐付いていないと購入できない' do
        @shopping_address.user_id = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていないと購入できない' do
        @shopping_address.product_id = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
