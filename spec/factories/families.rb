FactoryBot.define do
  factory :family do
    name { "#{Faker::Name.last_name} Family" }
    join_code { SecureRandom.alphanumeric(6).upcase }
  end
end
