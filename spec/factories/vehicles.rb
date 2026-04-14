FactoryBot.define do
  factory :vehicle do
    family
    vehicle_type { Vehicle.vehicle_types.keys.sample }
    make         { Faker::Vehicle.make }
    model        { Faker::Vehicle.model }
    year         { Faker::Vehicle.year }
    color        { Faker::Vehicle.color }
    vin          { Faker::Vehicle.vin }
    license_plate { Faker::Vehicle.license_plate }
    fuel_type    { Vehicle.fuel_types.keys.sample }
    purchase_date  { Faker::Date.backward(days: 3650) if [ true, false ].sample }
    purchase_price { rand(5000..80000) if [ true, false ].sample }
    current_value  { rand(3000..75000) if [ true, false ].sample }
    nickname       { [ "Land Ship", "Big Red", "Linda", "The Bus", "Free Bird" ].sample if [ true, false ].sample }
  end
end
