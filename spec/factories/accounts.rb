FactoryBot.define do
  factory :account do
    name { Faker::Bank.name }
    due_date { Faker::Date.birthday }
  end
end
