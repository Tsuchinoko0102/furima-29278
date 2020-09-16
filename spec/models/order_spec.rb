require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入のテスト' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'すべての項目が入力されていたら登録できる' do
      expect(@order).to be_valid
    end

    it 'user情報がない場合登録できないこと' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('User must exist')
    end

    it 'item情報がない場合登録できないこと' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Item must exist')
    end

    it '既に購入されているものに対して、再び購入登録ができないこと' do
      @order.save
      another_order = FactoryBot.build(:order, item: @order.item)
      another_order.valid?
      expect(another_order.errors.full_messages).to include('Item has already been taken')
    end

    it 'token情報がない場合登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include('Token must exist')
    end
  end
end
