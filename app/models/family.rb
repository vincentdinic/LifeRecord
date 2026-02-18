class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
end
