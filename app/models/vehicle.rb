class Vehicle < ApplicationRecord
  belongs_to :family
  has_many :maintenance_records, as: :maintainable, dependent: :destroy
  has_many :documents, as: :documentable, dependent: :destroy
  has_one_attached :image

  ROAD_VEHICLES = %w[sedan truck suv minivan motor_home motorcycle].freeze


  enum :vehicle_type, {
    sedan: "sedan",
    truck: "truck",
    suv: "suv",
    minivan: "minivan",
    motor_home: "motor_home",
    motorcycle: "motorcycle",
    boat: "boat",
    plane: "plane"
  }

  enum :fuel_type, {
    gasoline: "gasoline",
    diesel: "diesel",
    electric: "electric",
    hybrid: "hybrid",
    other: "other"
  }
  # ensures make, model, and vehicle type are present before creation
  validates :make, :model, :vehicle_type, presence: true
  # and vin if it's a road vehicle
  validates :vin, presence: true, if: -> { ROAD_VEHICLES.include?(vehicle_type) }

  def display_name
    nickname.presence || [ year, make, model ].compact.join(" ")
  end
end
