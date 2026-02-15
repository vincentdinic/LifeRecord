class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :family_users, dependent: :destroy
  has_many :families, through: :family_users
end
