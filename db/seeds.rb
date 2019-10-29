# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


for i in 1..3
  user = User.create!(
     
    email: Faker::Internet.email ,
    password: "password" 
  ) 
  profile = Profile.new( 
    name: Faker::GreekPhilosophers.name ,
    address: Faker::Address.city ,
    phone_number: Faker::Number.number(digits: 10) ,
    email: user.email
  ) 
  
  profile.user = user
  profile.save
  puts "Created #{i} profiles: profile #{profile.id}"
end 

for i in 1..3
  Developer.create!(
    developer_name: Faker::Company.name
  ) 
  puts "Created #{i} developers"
end


for i in 1..3
  Genre.create!(
    genre_description: Faker::Game.genre 
  ) 
    puts "Created #{i} genres"
end

for i in 1..3
  videogame = Videogame.new(
   name: Faker::Game.title ,
   developer_id: Developer.find(rand(1..3)).id,
   system_req: Faker::Device.manufacturer ,
   release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today) ,
   average_rating: Faker::Number.number(digits: 5) ,
   genre_id: Genre.find(rand(1..3)).id,
   profile_id: Profile.find(rand(1..3)).id 

)   
videogame.save
byebug
  puts "Created #{i} videogames #{videogame.id}"


end 

puts "Seeding complete"



