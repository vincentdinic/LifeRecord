class Family < ApplicationRecord
  before_create :generate_join_code
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :accounts
  has_many :events
  has_many :properties

  # returns the role of that specific user
  def role_for(user)
    family_users.find_by(user: user)&.role
  end

  def admin?(user)
    role = role_for(user)
    role == "admin" || role == "owner"
  end

  private

  def generate_join_code
    self.join_code ||= SecureRandom.alphanumeric(6).upcase
  end
end
