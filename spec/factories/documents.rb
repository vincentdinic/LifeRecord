FactoryBot.define do
  factory :document do
    title         { Faker::Book.title }
    description   { Faker::Lorem.sentence if [ true, false ].sample }
    document_type { Document.document_types.keys.sample }
    created_at { Faker::Date.backward(days: 3650) }
    updated_at { Faker::Date.backward(days: 250) }
  end
end
