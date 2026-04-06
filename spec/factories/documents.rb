FactoryBot.define do
  factory :document do
    title         { Faker::Book.title }
    description   { Faker::Lorem.sentence if [ true, false ].sample }
    document_type { Document.document_types.keys.sample }
  end
end
