class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    READING_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :nickname
    validates :family_name, format: {with: NAME_REGEX, message: "Full-width characters"}
    validates :first_name, format: {with: NAME_REGEX, message: "Full-width characters"}
    validates :family_name_reading, format: {with: READING_REGEX, message: "Full-width katakana characters"}
    validates :first_name_reading, format: {with: READING_REGEX, message: "Full-width katakana characters"}
    validates :birthday
  end
  
  with_options allow_blank: true do
    EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze
    PASS_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :email, format: {with: EMAIL_REGEX}
    validates :password, length: {minimum: 6}
    validates :password, format: {with: PASS_REGEX, message: "Include both letters and numbers"}
  end

  validates :email, uniqueness: { case_sensitive: true, message: "has already been taken"}

  


end
