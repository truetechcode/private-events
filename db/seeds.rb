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

EventAttendance.create(attendee_id: 1, 
        attended_event_id: 1)
    
10.times do |n|
username  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
User.create!(username:  username,
      email: email)
end

10.times do |n|
    description  = Faker::Lorem.sentence(5)
    date = Faker::Date.backward(14)
    creator_id = n+1
    Event.create!(description:  description,
          date: date,
          creator_id: creator_id)
    EventAttendance.create(attendee_id: creator_id, 
          attended_event_id: n+1)
end
    