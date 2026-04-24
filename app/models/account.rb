class Account < ApplicationRecord
  belongs_to :family
  has_many :documents, as: :documentable, dependent: :destroy

  validates :name, :due_date, presence: true
  def next_due_date
    today = Date.current
    next_due_date = today.change(day: due_date.day) rescue today.end_of_month
    next_due_date <= today ? next_due_date.next_month : next_due_date
  end
end
