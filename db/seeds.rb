require "json"

User.destroy_all
Activity.destroy_all

puts 'Creating activities...'

user = User.create!(
  email: "alpha@gmail.com",
  password: "123456",
)
user.save

Activity.create!(category: "Skiing", name: "Ski", address: "110 Boulevard du Midi Louise Moreau, Port du Béal", description: "Ski", user: user)
