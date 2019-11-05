# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

    
# for i in 1..50
#   user = User.create!(
     
#     email: Faker::Internet.email ,
#     password: "password" 
#   ) 
#   profile = Profile.new( 
#     name: Faker::GreekPhilosophers.name ,
#     country: Faker::Address.country ,
#     phone_number: Faker::Number.number(digits: 10) ,
#     )
     
  
#   profile.user = user
#   profile.save
#   puts "Created #{i} profiles: profile #{profile.id}"
# end 


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

# spec = ["Low", "Medium", "High"]
# number = [1,2,3,4,5]

# 80.times do |i|
#   v = Videogame.new
#      v.name = Faker::Game.title ,
#      v.description = Faker::Quote.matz,
#      v.developer_id = Developer.find(rand(1..25)).id,
#      v.system_req = spec.sample,
#      v.release_date = Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today),v.average_rating = number.sample,
#      v.genre_id = Genre.find(rand(1..3)).id,
#      v.profiles = profiles[i].profile_id

#      v.save
# end

# for i in 0..20
#  v = Videogame.create!(
#    name: Faker::Game.title ,
#    description: Faker::Quote.matz,
#    developer_id: Developer.find(rand(1..25)).id,
#    system_req: spec.sample,
#    release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today),  average_rating: number.sample,
#    genre_id: Genre.find(rand(1..3)).id,
#    v.profiles_profile_id: profiles[i].profile_id
  
#    )

  # for i in 1..200
  #   Videogame.create!(
  #    name: Faker::Game.title ,
  #    developer_id: Developer.find(rand(1..3)).id,
  #    system_req: Faker::Device.manufacturer ,
  #    release_date: Faker::Date.between_except(from: 30.year.ago, to: 1.year.from_now,  excepted: Date.today) ,
  #    average_rating: Faker::Number.number(digits: 5) ,
  #    genre_id: Genre.find(rand(1..3)).id,
    #  profile_id: Profile.find(rand(1..3)).id 
    #  profile_id:[]
    # )  



  puts "Seeding complete"





