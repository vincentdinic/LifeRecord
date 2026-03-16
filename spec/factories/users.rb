FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "user#{n}@example.com" }
    birthday { Faker::Date.birthday(max_age: 70) }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
