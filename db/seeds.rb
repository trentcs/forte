# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_image_url: ImageSuckr::GoogleSuckr.new.get_image_url)

  user.scores.create(title: Faker::Commerce.product_name, composer: Faker::Name.name, is_public: true, original_image: "http://upload.wikimedia.org/wikipedia/commons/0/07/Janaganamana-score.png")

  user.scores.create(title: Faker::Commerce.product_name, composer: Faker::Name.name, is_public: true, original_image: "http://s2.imslp.org/images/thumb/pdfs/de/5f059a63bddea20e54b2014ebbe334340c1afb64.png")

  user.scores.create(title: Faker::Commerce.product_name, composer: Faker::Name.name, is_public: false, original_image: "http://www.jwpepper.com/scores-png/10063331.png")

end
