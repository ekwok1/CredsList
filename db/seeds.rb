# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "hi@gmail.com", password: "secret")
User.create(email: "bye@gmail.com", password: "supersecret")

item_list = [
  [ "Toyota Camry", "2014, like new, couple of scrapes on rear bumper", "http://autobodysandyutah.com/wp-content/uploads/2011/11/Toyota-Totaled-No-Fix-2.jpg", 2000, 1 ],
  [ "Honda Accord", "2015, totaled", "https://media.ed.edmunds-media.com/honda/accord/2015/oem/2015_honda_accord_sedan_sport_fq_oem_5_300.jpg", 10, 2],
  [ "Playboy Mansion", "Old run-down mansion", "http://latimesblogs.latimes.com/.a/6a00d8341c630a53ef014e87d68b2f970d-640wi", 1000000, 1]
]

item_list.each do |name, description, pic_url, price, user_id|
  Item.create( name: name, description: description, pic_url: pic_url, price: price, user_id: user_id )
end
