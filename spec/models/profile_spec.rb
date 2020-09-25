require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '住所登録のテスト' do
    before do
      @profile = FactoryBot.build(:order_address)
    end

    it 'すべての情報が入力されていると登録できる' do
      expect(@profile).to be_valid
    end

    it 'buildingが空の場合でも、登録できること' do
      @profile.building = nil
      expect(@profile).to be_valid
    end

    it 'phone_numberが10桁の場合でも、登録ができること' do
      @profile.phone_number = '1234567890'
      expect(@profile).to be_valid
    end

    it 'userが存在ない場合登録できないこと' do
      @profile.user = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが存在しない場合登録できないこと' do
      @profile.item = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("Item can't be blank")
    end

    it 'postalが空の場合登録できないこと' do
      @profile.postal = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("Postal can't be blank")
    end

    it 'postalにハイフンがない場合登録できないこと' do
      @profile.postal = '1234567'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalが3桁+ハイフン+4桁でない場合、登録ができないこと' do
      @profile.postal = '1234-567'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalに半角英字が含まれる場合登録できないこと' do
      @profile.postal = '123456a'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Postal Input correctly')
    end

    it 'postalに全角が含まれる場合登録できないこと' do
      @profile.postal = '１２３-４５６７'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Postal Input correctly')
    end

    it 'prefectureが空の場合登録できないこと' do
      @profile.prefecture_id = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefectureのidが1の場合登録できないこと' do
      @profile.prefecture_id = 1
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Prefecture Select')
    end

    it 'cityが空の場合登録できないこと' do
      @profile.city = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空の場合登録できないこと' do
      @profile.house_number = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空の場合登録できないこと' do
      @profile.phone_number = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁未満の場合登録できないこと' do
      @profile.phone_number = '123456789'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'phone_numberに半角英字が含まれる場合登録できないこと' do
      @profile.phone_number = '123456789a'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Phone number Input correctly')
    end

    it 'phone_numberに全角が含まれる場合登録できないこと' do
      @profile.phone_number = '１２３４５６７８９０'
      @profile.valid?
      expect(@profile.errors.full_messages).to include('Phone number Input correctly')
    end
  end
end
