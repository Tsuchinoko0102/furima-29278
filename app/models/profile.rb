class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postal
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number
  end
end
