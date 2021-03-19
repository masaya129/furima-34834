class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :birthday, presence: true
  
  with_options presence: true do
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :first_name_katakana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_katakana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :password, format: {with: /\A[a-z0-9]+\z/i}
  end
end
