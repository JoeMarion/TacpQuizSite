User.destroy_all

# User creation

User.create!(first_name: "Joe", last_name: "Marion", admin: true, username: "JoeMarion", email: "joemarion.io@gmail.com", birthday: "01-16-1991", password: "password", password_confirmation: "password", activated: true, activated_at: Time.zone.now)

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email
  username = Faker::Internet.user_name("#{first_name} #{last_name}")
  birthday = "01-01-1990"
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, admin: false, username: username, email: email, birthday: birthday, password: "password", password_confirmation: "password", activated: true, activated_at: Time.zone.now)
end
