def seed_development
  seed_config
  seed_users
  seed_families
  seed_accounts
  seed_events
  seed_properties
end

def seed_config
  3.times do
    FactoryBot.create :user
  end
  user = FactoryBot.create :user, email: "vincent@example.com",
                    first_name: "Vincent",
                    last_name: "Di Nicolantonio",
                    birthday: Date.new(2004, 8, 25)
  family = FactoryBot.create :family, name: "Di Nicolantonio Family"
  FactoryBot.create :family_user, user: user, family: family, role: 2
  User.all.each do |user|
    unless FamilyUser.exists?(user: user, family: family)
      FactoryBot.create :family_user, user: user, family: family
    end
  end
end

def seed_users
  puts "Seeding Users"
  15.times do
    FactoryBot.create :user
  end
end

def seed_families
  puts "Seeding Families"
  2.times do
    family = FactoryBot.create :family
    owner = User.find_by(email: "vincent@example.com", birthday: Date.new(2004, 8, 25))
    FactoryBot.create :family_user, user: owner, family: family, role: 2
    User.all.sample(4).each do |user|
      unless FamilyUser.exists?(user: user, family: family)
        FactoryBot.create :family_user, user: user, family: family
      end
    end
  end
end

def seed_accounts
  puts "Seeding Accounts"
  Family.all.each do |family|
    5.times do
      FactoryBot.create :account, family: family
    end
  end
end

def seed_events
  puts "Seeding Events"
  Family.all.each do |family|
    20.times do
      FactoryBot.create :event, family: family
    end
  end
end

def seed_properties
  puts "Seeding Properties"
  Family.all.each do |family|
    3.times do
      FactoryBot.create :property, family: family
    end
  end
end

seed_development
