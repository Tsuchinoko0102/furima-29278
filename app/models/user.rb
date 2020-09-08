class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, format: {with: /\A\S+@\S+\.\S+\z/}, uniqerness: true
    validates :password, format: {with: /\A[a-zA-Z0-9]+\z/}, length: {minimum: 6}
    validates :family_name, with: NAME_REGEX
    validates :first_name, with:NAME_REGEX
    validates :family_name_reading, with: READING_REGEX
    validates :first_name_reading, with: READING_REGEX
  end
  
end
