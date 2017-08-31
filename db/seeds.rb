# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Examle man",
             email: "examp@example.com",
             password: "example",
             password_confirmation: "example",
             admin: true
             )

100.times do |n|
# this is loop
 name = Faker::Name.name
 email = "user-#{n+1}@example.com"
 password = "password"
 User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password
             )
end
 # default admin is false
 # 増やしたい時はtimesの数変えるだけ。
 # 減らしたい時は一旦 rake db:reset する必要
 
 
users = User.order(:created_at).take(6)
50.times do
 content = Faker::Lorem.sentence(5)
 # Lorem - dummytext
 # 5 は、最大5のlengthのtextという意味
 
 users.each { |user| user.microposts.create!(content: content) }
end



# Following relationships
users = User.all
#fromユーザーテーブル

user  = users.first
following = users[2..50]
#userのIDの２から５０
followers = users[3..40]
#userのIDの３から４０

following.each { |followed| user.follow(followed) }
#followingの単数系がfollowed
followers.each { |follower| follower.follow(user) }
#フォローイングに関するseeds
