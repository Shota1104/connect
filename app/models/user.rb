class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_one :category
  has_many :messages
  has_many :room_users
  has_many :rooms, through: :room_users

  with_options presence: true, on: :create do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
