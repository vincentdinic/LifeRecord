FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_time { "2026-03-23 13:24:26" }
    end_time { "2026-03-23 13:24:26" }
    family { nil }
  end
end
