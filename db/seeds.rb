def seed_development
  user = seed_user
  family = seed_family
  seed_family_user(user, family)
end

def seed_user
  puts "Seeding User"
  User.find_or_create_by!(email: "vincent@example.com") do |user|
    user.first_name = "Vincent"
    user.last_name = "Di Nicolantonio"
    user.birthday = Date.new(2004, 8, 25)
    user.password = "password123"
    user.password_confirmation = "password123"
  end
end

def seed_family
  puts "Seeding Family"
  Family.find_or_create_by!(name: "Doe Family") do |family|
    family.join_code = SecureRandom.alphanumeric(6).upcase
  end

end

def seed_family_user(user, family)
  puts "Seeding Family User"
  FamilyUser.find_or_create_by!(user: user, family: family, role: 2)
end

seed_development
