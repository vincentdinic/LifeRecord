FactoryBot.define do
  factory :education_record do
    user

    school_name    { Faker::University.name }
    field_of_study { Faker::Educator.subject }
    degree_type    { EducationRecord.degree_types.keys.sample }
    city           { Faker::Address.city }
    state          { Faker::Address.state }
    country        { "United States" }
    start_date     { Faker::Date.backward(days: 3650) }
    current        { [ true, false, false, false ].sample }

    after(:build) do |record|
      if record.current?
        record.end_date = nil
      else
        record.end_date = record.start_date + rand(365..1460).days
      end
    end

    gpa { [ 1.5, 2.0, 2.5, 2.8, 3.0, 3.25, 3.5, 3.7, 4.0 ] if [ true, false ].sample }
  end
end
