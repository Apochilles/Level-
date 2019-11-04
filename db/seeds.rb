# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


for i in 0..50
  u = User.create!(email: Faker::Internet.email ,password: "password" ) 
  u.create_profile!(name: Faker::GreekPhilosophers.name ,country: Faker::Address.country , phone_number: Faker::PhoneNumber.cell_phone) 
  
end 

for i in 0..50
  Developer.create!(
    developer_name: Faker::Company.name
  ) 
  puts "Created #{i} developers"
end


for i in 0..25
  Genre.create!(
    genre_description: Faker::Game.genre 
  ) 
    puts "Created #{i} genres"
end

# for i in 0..20
#   Videogame.create!(
#    name: Faker::Game.title ,
#    description: Faker::Quote.matz,
#    developer_id: Developer.find(rand(1..25)).id,
#    system_req: system_req.(rand(system_req: Low Medium High)),
#    release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today) ,
#    average_rating: Faker::Number.between(from: 1, to: 5),
#    genre_id: Genre.find(rand(1..25).id
#   #  profile.profile_id: Profile.find(rand(1..50)).id
#   )

# end 

  puts "Seeding complete"



