# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: "Example User",
    email: "example@railstutorial.org")

Event.create!(description:  "This is a fake event",
        date: Time.now,
        creator_id: 1)
    
(1..5).each do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  description  = Faker::Lorem.sentence(5)
  date = Faker::Date.backward(7)
  creator_id = n+1
  User.create!(username:  username,
        email: email)
  Event.create!(description:  description,
        date: date,
        creator_id: creator_id)
end

(6..10).each do |n|
  username  = Faker::Name.name
  email = "test-#{n+1}@railstutorial.org"
  description  = Faker::Lorem.sentence(5)
  date = Faker::Date.forward(7)
  creator_id = n+1
  User.create!(username:  username,
        email: email)
  Event.create!(description:  description,
        date: date,
        creator_id: creator_id)
end