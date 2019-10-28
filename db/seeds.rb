# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


for i in 1..20
  User.create(
     
    email: Faker::Internet.email ,
    password: Faker::Internet.password 
      
) 
  puts "Created #{i} records"
end 

for i in 1..20
  Developer.create(
     
    developer_name: Faker::Company.name
) 
  puts "Created #{i} records"
end 

for i in 1..20
  Genre.create(
     
    genre_description: Faker::Game.genre 
) 
  puts "Created #{i} records"
end 

for i in 1..20
  Profile.create(
     
    name: Faker::GreekPhilosophers.name ,
    address: Faker::Address.city ,
    phone_number: Faker::Number.number(digits: 10) ,
    email: Faker::Internet.email
) 
  puts "Created #{i} records"
end 

for i in 1..20
  Videogame.create(
     
   name: Faker::Game.title ,
   developer: Faker::Company.name ,
   system_req: Faker::Device.manufacturer ,
   release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today) ,
   average_rating: Faker::Number.number(digits: 5) ,
) 
  puts "Created #{i} records"
end 


