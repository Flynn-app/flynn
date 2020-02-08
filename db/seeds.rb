require 'faker'

puts "Delete User database"
User.delete_all

puts "Create User"
User.create!(
  email: "test@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Internet.username,
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."

User.create!(
  email: "test2@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Internet.username,
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."

User.create!(
  email: "test3@test.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Internet.username,
  password:  '123456',
  password_confirmation: '123456',
  user_bio: Faker::Quote.matz
)
print "."

