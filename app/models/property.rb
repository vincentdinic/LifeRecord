class Property < ApplicationRecord
  belongs_to :family

  enum :occupancy_status, {
    primary: 0,
    secondary: 1,
    vacant: 2
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
