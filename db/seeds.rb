def seed_development
  seed_config
  seed_users
  seed_family
  seed_accounts
end

def seed_config
  user = FactoryBot.create :user, email: "vincent@example.com",
                    first_name: "Vincent",
                    last_name: "Di Nicolantonio",
                    birthday: Date.new(2004, 8, 25)
  family = FactoryBot.create :family, name: "Di Nicolantonio Family"
  FactoryBot.create :family_user, user: user, family: family, role: 2
end

def seed_users
  puts "Seeding Users"
  15.times do
    FactoryBot.create :user
  end
end

def seed_family
  puts "Seeding Families"
  2.times do
    family = FactoryBot.create :family
    owner = User.first
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

seed_development
