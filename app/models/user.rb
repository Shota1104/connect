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
  # accepts_nested_attributes_for:room_user
 

  with_options presence: true , on: :registration do |registration|
  registration.validates :nickname
  registration.validates :email
  registration.validates :password, format: { with: /\A[a-z0-9]+\z/i }
  registration.validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  registration.validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  registration.validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  registration.validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
  end 

end
