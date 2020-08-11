# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating properties"

Property.destroy_all

p1 = Property.create! name: 'Auburn square', address: '35 Northumberland Rd, Auburn, NSW', price: 600000, rooms: 4, bathrooms: 2, image: 'https://rimh2.domainstatic.com.au/HZr3aMrP9Mq7iTc3CuIrbAiUsvQ=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/908badf3-fa63-490a-b843-06f04d91d7a2-w1440-h1080'
p2 = Property.create! name: 'River Realty', address: '36 Victoria Street, Mcmahons Point, NSW', price: 600000, rooms: 4, bathrooms: 2, image: 'https://rimh2.domainstatic.com.au/Yuovn_kxahV7G8OkPOw0Oab4QXM=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016405420_1_1_200728_073453-w4000-h2667'
p3 = Property.create! name: 'Malvern Avenue', address: '49 Malvern Avenue, Manly NSW 2095', price: 600000, rooms: 4, bathrooms: 2, image: 'https://rimh2.domainstatic.com.au/hzVJfNiBmvhAjMwTSGvsewfxw6U=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016388660_1_1_200721_023310-w1600-h1200'

puts "created #{Property.count} properties."

User.destroy_all

u1 = User.create! email: 'kart@ga.com', password: 'chicken', name: 'Kart', admin: true
u2 = User.create! email: 'baga@ga.com', password: 'chicken', name: 'Bagavathi'
u3 = User.create! email: 'geet@ga.com', password: 'chicken', name: 'Geet'

puts "Created #{User.count} users."

u1.properties << p1 << p3
u2.properties << p2

print "User #{User.first.name} has properties:"
puts User.first.properties.pluck(:name).join(',')
