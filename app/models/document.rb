class Document < ApplicationRecord
  # Allows a document to belong to any model - creates fields documentable_type and documentable_id
  belongs_to :documentable, polymorphic: true
  belongs_to :uploaded_by, class_name: "User"
  has_one_attached :file

  scope :recent, -> { order(updated_at: :desc) }

  enum :document_type, {
    education: "education",
    employment: "employment",
    insurance: "insurance",
    registration: "registration",
    maintenance: "maintenance",
    tax: "tax",
    other: "other"
  }

  validates :title, :document_type, presence: true
end
