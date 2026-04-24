class Event < ApplicationRecord
  belongs_to :family
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :title, :start_time, :end_time, presence: true

  scope :by_name, ->(name) { where("title ILIKE ?", "%#{name}%") if name.present? }
  scope :starting_after, ->(date) { where("start_time >= ?", date) if date.present? }
  scope :ending_before, ->(date) { where("end_time <= ?", date) if date.present? }
  scope :for_user, ->(user_id) {
    if user_id.present?
      joins(:users).where(users: { id: user_id })
    end
  }
  scope :filter_events, ->(params) {
    by_name(params[:name]).starting_after(params[:start_date])
                          .ending_before(params[:end_date])
                          .for_user(params[:user_id])
  }
end
