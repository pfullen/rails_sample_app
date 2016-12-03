# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
User.create!(name: 'Peter J. Fullen',
             email: 'peter@fullencpa.com',
             cell_phone: '404-931-8079',
             last_name: 'Fullen',
             first_name: 'Peter',
             password: 'hodie8888',
             password_confirmation: 'hodie8888',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
 99.times do |n|
     first_name = Faker::Name.first_name
     last_name = Faker::Name.last_name
    name = Faker::Name.last_name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    password_confirmation = "password"
    cell_phone = Faker::PhoneNumber.cell_phone
    User.create!(name: name,
                 last_name: last_name,
                 first_name: first_name,
                 cell_phone: cell_phone,
                 email: email,
                 password: password,
                 password_confirmation: password_confirmation,
                 activated: true,
                 activated_at: Time.zone.now)
  end

#Micoposts
  users = User.order(:created_at).take(6)
  50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
  end

 # Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }