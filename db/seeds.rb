# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

    
for i in 1..50
  user = User.create!(
     
    email: Faker::Internet.email ,
    password: "password" 
  ) 
  profile = Profile.new( 
    name: Faker::GreekPhilosophers.name ,
    country: Faker::Address.country ,
    phone_number: Faker::Number.number(digits: 10)    ,
    email: user.email 

    )
     
  
  profile.user = user
  profile.save
  puts "Created #{i} Users #{user.id} and Profile #{profile.id} "
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

  
spec = ["Low", "Medium", "High"]
number = [1,2,3,4,5]

  
  for i in 1..200
    Videogame.create!(
     name: Faker::Game.title ,
     developer_id: Developer.find(rand(1..50)).id,
     description: Faker::Quote.matz,
     system_req: spec.sample, 
     release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today) ,
     average_rating: number.sample ,
     genre_id: Genre.find(rand(1..25)).id,
     )
     
  end

  for i in 1..200  
     ProfileVideogame.create!(
       videogame_id: Videogame.find(rand(1..200)).id, 
       profile_id: Profile.find(rand(1..50)).id ,
       role: "uploader" ,
       )

     
     
   end

  puts "Seeding complete"





