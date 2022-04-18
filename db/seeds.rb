# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Purr.destroy_all
Like.destroy_all
Follow.destroy_all

user1 = User.create!(
    name: "Ellis Pae",
    email: "ellis@gnar.dog",
    phone_number: "(000) 555-0000",
    dob: Date.strptime("07/20/1990", "%m/%d/%Y"),
    handle: "quest_like",
    password: "coolbeans",
    encrypted_password: "coolbeans", 
    bio: "Am I wrong 'cause I wanna get it on 'til I die?"
)


user2 = User.create!(
    name: "James Bond",
    email: "agent007@sample.com",
    phone_number: "(000) 555-9999",
    dob: Date.strptime("10/10/1990", "%m/%d/%Y"),
    handle: "man_of_mystery", 
    password: "coolbeans",
    encrypted_password: "coolbeans", 
    bio: "Shaken, not stirred"
)

user3 = User.create!(
    name: "Cloud Strife",
    email: "omnislash@sample.com",
    phone_number: "(000) 555-8888",
    dob: Date.strptime("06/29/1990", "%m/%d/%Y"),
    handle: "buster_blader", 
    password: "coolbeans",
    encrypted_password: "coolbeans", 
    bio: "I'm so emo"
)

user4 = User.create!(
    name: "Diana Prince",
    email: "wonder_woman@sample.com",
    phone_number: "(000) 555-7777",
    dob: Date.strptime("03/04/1990", "%m/%d/%Y"), 
    handle: "amazonian", 
    password: "coolbeans",
    encrypted_password: "coolbeans", 
    bio: "I have an invisible jet even though I can fly"
)



purr1 = Purr.create!(content: "I never sleep 'cause sleep is the cousin of death", user_id: user1.id)
purr2 = Purr.create!(content: "Spectre... I'm onto you", user_id: user2.id)
purr3 = Purr.create!(content: "It's crazy out here in Nibelheim!", user_id: user3.id)
purr4 = Purr.create!(content: "Move aside Steve Trevor, you're not that useful!", user_id: user4.id)

purr5 = Purr.create!(content: "Hell nah", original_purr_id: purr1.id, user_id: user4.id)


like2 = Like.create!(user_id: user3.id, purr_id: purr1.id)
like3 = Like.create!(user_id: user4.id, purr_id: purr1.id)
like4 = Like.create!(user_id: user3.id, purr_id: purr2.id)
like5 = Like.create!(user_id: user4.id, purr_id: purr2.id)
like7 = Like.create!(user_id: user1.id, purr_id: purr3.id) 
like8 = Like.create!(user_id: user2.id, purr_id: purr3.id) 
like6 = Like.create!(user_id: user1.id, purr_id: purr4.id) 
like6 = Like.create!(user_id: user2.id, purr_id: purr4.id) 

follow1 = Follow.create!(follower_id: user4.id, followee_id: user1.id)
follow2 = Follow.create!(follower_id: user3.id, followee_id: user1.id)
follow3 = Follow.create!(follower_id: user2.id, followee_id: user1.id)

follow4 = Follow.create!(follower_id: user1.id, followee_id: user2.id)
follow5 = Follow.create!(follower_id: user3.id, followee_id: user2.id)
follow6 = Follow.create!(follower_id: user4.id, followee_id: user2.id)

follow7 = Follow.create!(follower_id: user1.id, followee_id: user3.id)

follow7 = Follow.create!(follower_id: user3.id, followee_id: user4.id)
follow8 = Follow.create!(follower_id: user2.id, followee_id: user4.id)




