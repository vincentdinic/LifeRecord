class MaintenanceRecord < ApplicationRecord
  belongs_to :maintainable, polymorphic: true
  belongs_to :created_by, class_name: "User"
  has_many :documents, as: :documentable, dependent: :destroy
end
