require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報登録のテスト' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての情報が入力されていると登録できる' do
      expect(@order_address).to be_valid
    end

    it 'buildingが空の場合でも、登録できること' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it 'phone_numberが10桁の場合でも、登録ができること' do
      @order_address.phone_number = '1234567890'
      expect(@order_address).to be_valid
    end

    it 'userが存在ない場合登録できないこと' do
      @order_address.user = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが存在しない場合登録できないこと' do
      @order_address.item = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'postalが空の場合登録できないこと' do
      @order_address.postal = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal can't be blank")
    end

    it 'postalにハイフンがない場合登録できないこと' do
      @order_address.postal = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalが3桁+ハイフン+4桁でない場合、登録ができないこと' do
      @order_address.postal = '1234-567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalに半角英字が含まれる場合登録できないこと' do
      @order_address.postal = '123456a'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalに全角が含まれる場合登録できないこと' do
      @order_address.postal = '１２３-４５６７'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal Input correctly')
    end

    it 'prefectureが空の場合登録できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefectureのidが1の場合登録できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture Select')
    end

    it 'cityが空の場合登録できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空の場合登録できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空の場合登録できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁未満の場合登録できないこと' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'phone_numberに半角英字が含まれる場合登録できないこと' do
      @order_address.phone_number = '123456789a'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'phone_numberに全角が含まれる場合登録できないこと' do
      @order_address.phone_number = '１２３４５６７８９０'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'tokenが空の場合登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
