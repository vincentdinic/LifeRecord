FactoryBot.define do
  factory :employment_record do
    user
    company_name { Faker::Company.name }
    role { Faker::Job.title }
    department { Faker::Job.field if [ true, true, false ].sample }
    city              { Faker::Address.city }
    state             { Faker::Address.state }
    country           { "United States" }
    location_type     { EmploymentRecord.location_types.keys.sample }
    employment_type   { EmploymentRecord.employment_types.keys.sample }
    employment_status { EmploymentRecord.employment_statuses.keys.sample }
    salary_type       { EmploymentRecord.salary_types.keys.sample }
    salary            { [ rand(10..30), rand(400..1000), rand(1000..3000),
                          rand(1500..8000), rand(45000..200000) ].sample }
    pay_day           { [ "Monday", "Friday", "1st", "15th", "Last of month" ].sample }
    start_date        { Faker::Date.backward(days: 3650) }
    current           { [ true, false, false, false ].sample }

    after(:build) do |record|
      if record.current?
        record.end_date = nil
        record.employment_status = "active"
      else
        record.end_date = record.start_date + rand(180..1825).days
      end
    end
  end
end
