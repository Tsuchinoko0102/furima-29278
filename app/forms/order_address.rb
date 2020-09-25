class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal, :prefecture_id,
                :city, :house_number, :building, :phone_number, :order, :token, :price, :order_id, :address

  with_options presence: true do
    # ordersテーブルのバリデーション
    validates :user
    validates :item
    validates :token
    validates :price
    # addressesテーブルのバリデーション
    validates :postal
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number
  end

  # addressesテーブルのバリデーション
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input correctly' }

  def save
    @order = Order.create(user_id: user, item_id: item, token: token)

    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, order_id: @order.id)
  end
end
