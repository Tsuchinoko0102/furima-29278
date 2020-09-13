class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal, :prefecture_id, :city, :house_number, :building, :phone_number, :order

  with_options presence: true do
    #ordersテーブルのバリデーション
    validates :user
    validates :item
    #addressesテーブルのバリデーション
    validates :postal
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end

  #addressesテーブルのバリデーション
  validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/, message:"Input correctly"}
  validates :phone_number, format: {with: /\A\d{10, 11}\z/}, message:"Input correctly"}

end