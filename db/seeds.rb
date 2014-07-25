# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do

  User.create(first_name: 'john', last_name: 'smith', email: 'js
mith@aol.com', password_digest: 'yo', user_image_url: open("/Users/trentcs/Desk
top/ctl231_photos/wab.jpg"))

  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password_digest: "password", user_image_url: open("download.jpeg"))


  user.scores.create(title: Faker::Commerce.product_name, composer: Faker::Name.name, is_public: true, original_image: open("zelda.png"))



  user.scores.create(title: Faker::Commerce.product_name, composer: Faker::Name.name, is_public: false, original_image: open("zelda.png"))


end
