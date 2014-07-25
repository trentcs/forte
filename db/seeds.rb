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

end
