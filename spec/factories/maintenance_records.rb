FactoryBot.define do
  factory :maintenance_record do
    title { [ "Appliance Repair", "Property Inspection", "Bathroom Renovation", "General Maintenance",
              "Garage Door Replacement", "Epoxy Flooring", "Hardwood Replacement", "Oil Change",
              "Air Filter Replacement", "Engine Rebuild", "Muffler Removal", "Turbocharger Install" ].sample }
    description { Faker::Lorem.paragraph(sentence_count: 4) if [ true, false ].sample }
    performed_on { Faker::Time.between(from: 1000.days.ago, to: Time.zone.today) }
    cost { [ rand(50..500), rand(500..5000), rand(5000..25000) ].sample }
    contractor { Faker::Company.name if [ true, true, false ].sample }
  end
end
