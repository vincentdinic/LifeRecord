class EducationRecord < ApplicationRecord
  belongs_to :user
  has_many :documents, as: :documentable, dependent: :destroy

  enum :degree_type, {
    high_school_diploma: "high_school_diploma",
    associates: "associates",
    bachelors: "bachelors",
    masters: "masters",
    doctorate: "doctorate",
    other: "other"
  }
  validates :school_name, :degree_type, :start_date, presence: true
  validate :start_date_before_end_date
  validate :end_date_required_unless_current

  private

  def start_date_before_end_date
    return unless start_date && end_date
    errors.add(:start_date, "must be before end date") if start_date > end_date
  end

  def end_date_required_unless_current
    return if current?
    errors.add(:end_date, "is required unless you currently attend this institution") unless end_date
  end
end
