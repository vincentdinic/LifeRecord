class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_many :family_users, dependent: :destroy
  has_many :families, through: :family_users
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  has_many :education_records, dependent: :destroy
  has_many :employment_records, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy

  scope :eldest, -> { order(birthday: :asc) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
