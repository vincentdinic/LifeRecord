class FamilyUser < ApplicationRecord
  belongs_to :user
  belongs_to :family

  enum :role, { member: 0, admin: 1, owner: 2 }
end
