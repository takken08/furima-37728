require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail,passwordとpassword_confirmation,last_nameとfirst_name,last_name_katakanaとfirst_name_katakanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録はできない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角でないと登録できない' do
        @user.last_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Please enter in Full-width characters.")
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'last_name_katakanaが全角カナでないと登録できない'do
        @user.last_name_katakana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana Please enter in katakana characters")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角ではないと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Please enter in Full-width characters.")
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'first_name_katakanaが全角かなでないと登録できない' do
        @user.first_name_katakana = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana Please enter in katakana characters")
      end
    end
  end
end