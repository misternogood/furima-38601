require 'rails_helper'

RSpec.describe OrderShopper, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_shopper = FactoryBot.build(:order_shopper, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  
  describe '購入情報の登録' do
    context '購入情報を正しく入力している場合' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@order_shopper).to be_valid
      end

      it ' buildingが空でも登録できる' do
        @order_shopper.building = ''
        expect(@order_shopper).to be_valid
      end

      it ' phone_numberが10文字でも登録できる' do
        @order_shopper.phone_number = '0801234567'
        expect(@order_shopper).to be_valid
      end
    end

    context '購入情報を正しく入力していない場合' do
      it 'postal_codeが空では登録できない' do
        @order_shopper.postal_code = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンを含んだ正しいフォーマットでないと登録できない' do
        @order_shopper.postal_code = '1234567'
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが(---)では登録できない' do
        @order_shopper.prefecture_id = '1'
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_shopper.city = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空では登録できない' do
        @order_shopper.addresses = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_shopper.phone_number = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字以外では登録できない' do
        @order_shopper.phone_number = '090-1234-56'
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include('Phone number is not a number')
      end

      it 'phone_numberの数字が9文字以下では登録できない' do
        @order_shopper.phone_number = '080123456'
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberの数字が12文字以上では登録できない' do
        @order_shopper.phone_number = '080123456789'
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'user_idが空では登録できない' do
        @order_shopper.user_id = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_shopper.item_id = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order_shopper.token = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Token can't be blank")
      end

      it 'priceが空では登録できない' do
        @order_shopper.price = ''
        @order_shopper.valid?
        expect(@order_shopper.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end