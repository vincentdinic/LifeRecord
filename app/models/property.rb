class Property < ApplicationRecord
  belongs_to :family

  def full_address
  [ street, ("Unit ##{unit}" if unit.present?),
    "#{city}, #{state} #{zip_code}",
    country ].compact.join(", ")
  end
end
