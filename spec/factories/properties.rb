FactoryBot.define do
  factory :property do
    name { Faker::Address.community }
    description { Faker::Lorem.paragraph(sentence_count: 3) if [ true, false ].sample }
    street { Faker::Address.street_address }
    city { Faker::Address.city }
    state  { Faker::Address.state }
    zip_code { Faker::Address.zip_code }
    country { "United States" }

    unit { Faker::Address.building_number if [ true, true, false ].sample }

    bedrooms  { rand(1..6) }
    bathrooms { [ 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0 ].sample }
    purchase_date { Faker::Date.backward(days: 3650) if [ true, false ].sample }
    square_feet   { rand(500..12000) }
    year_built    { rand(1950..2024) }

    occupancy_status { Property.occupancy_statuses.keys.sample }
    ownership_status { Property.ownership_statuses.keys.sample }
  end
end
