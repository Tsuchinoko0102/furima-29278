require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '配送先住所登録のテスト' do
    before do
      @order = FactoryBot.create(:order)
      @address = FactoryBot.build(:address, order: @order)
    end

    it 'order_idが存在しない場合登録できないこと' do
      @address.order = nil
      @address.valid?
      expect(@address.errors.full_messages).to include('Order must exist', "Order can't be blank")
    end

    it 'order_idが重複する場合登録できないこと' do
      @address.save
      another_address = FactoryBot.build(:address, order: @order)
      another_address.valid?
      expect(another_address.errors.full_messages).to include('Order has already been taken')
    end
  end
end
