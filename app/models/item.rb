class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :text
    validates :price
    validates :user
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :duration_id
  end

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :duration_id
  end

end