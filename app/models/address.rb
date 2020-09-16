class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  validates :order_id, presence: true
  validates :order_id, uniqueness: true
end
