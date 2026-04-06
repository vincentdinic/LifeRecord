FactoryBot.define do
  factory :event do
    title { Faker::Music::GratefulDead.song }
    description { Faker::Lorem.paragraph(sentence_count: 3) }

    start_time { Faker::Time.between(from: 2.weeks.ago, to: 2.weeks.from_now) }
    end_time   { start_time + rand(1..4).hours }

    after(:create) do |event|
      if event.family.users.any?
        users = event.family.users.sample(rand(1..3))
        users.each do |user|
          create(:user_event, event: event, user: user)
        end
      end
    end
  end
end
