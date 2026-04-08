class EmploymentRecord < ApplicationRecord
  belongs_to :user
  has_many :documents, as: :documentable, dependent: :destroy

  enum :location_type, {
    on_site: "on_site",
    hybrid: "hybrid",
    remote: "remote"
  }

  enum :employment_type, {
    full_time: "full_time",
    part_time: "part_time",
    contract: "contract",
    internship: "internship"
  }

  enum :employment_status, {
    active: "active",
    resigned: "resigned",
    terminated: "terminated",
    laid_off: "laid_off",
    retired: "retired"
  }

  enum :salary_type, {
    hourly: "hourly",
    weekly: "weekly",
    bi_weekly: "bi_weekly",
    monthly: "monthly",
    annual: "annual"
  }

  validates :company_name, :role, :location_type, :employment_type,
            :employment_status, :start_date, presence: true
  validate :start_date_before_end_date
  validate :end_date_required_unless_current

  private

  def start_date_before_end_date
    return unless start_date && end_date
    errors.add(:start_date, "must be before end date") if start_date > end_date
  end

  def end_date_required_unless_current
    return if current?
    errors.add(:end_date, "is required unless this is your current position") unless end_date
  end
end
