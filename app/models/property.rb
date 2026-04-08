class Property < ApplicationRecord
  belongs_to :family
  has_many :maintenance_records, as: :maintainable, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_one_attached :image

  enum :occupancy_status, {
    primary: 0,
    secondary: 1,
    vacant: 2 # could change to rental/income property
  }

  enum :ownership_status, {
    owned: 0,
    mortgaged: 1,
    leased: 2
  }

  def full_address
  [ street, ("Unit ##{unit}" if unit.present?),
    "#{city}, #{state} #{zip_code}",
    country ].compact.join(", ")
  end
end
