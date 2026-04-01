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
  end
end
