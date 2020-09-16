class Order < ApplicationRecord
  attr_accessor :token
  validates :item_id, uniqueness: true
  validates :token, presence: { message: 'must exist' }

  has_one :address
  belongs_to :user
  belongs_to :item
end
