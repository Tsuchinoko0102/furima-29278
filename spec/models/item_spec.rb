require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.user_id = @user.id
    end

    it 'すべての項目が入力されていたら登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'imageが存在していないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceに半角英字が入力されたら登録できないこと' do
      @item.price = '300t'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceに全角文字が入力されたら登録できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceが300未満の場合登録できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 300')
    end

    it 'priceが9,999,999より大きい場合登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end

    it 'userの情報がない場合登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end

    it 'categoryのidが1の場合は登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'statusのidが1の場合は登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end

    it 'feeのdiが１の場合は登録できないこと' do
      @item.fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee Select')
    end

    it 'prefectureのidが1の場合は登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'durationのiｄが1の場合は登録できないこと' do
      @item.duration_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Duration Select')
    end
  end
end
