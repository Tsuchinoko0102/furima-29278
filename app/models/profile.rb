class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postal
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input correctly' }
end
