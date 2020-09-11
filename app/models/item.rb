class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration
  has_one_attached :image

  with_options presence: { message: "can't be blank" } do
    validates :name
    validates :text
    validates :image
    validates :price
    validates :user
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :duration_id
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :duration_id
  end

  validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid' }
  validates :price, numericality: { greater_than: 300 }
  validates :price, numericality: { less_than: 9_999_999 }
end
