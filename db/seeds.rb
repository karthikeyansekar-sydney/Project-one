# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating properties"

Property.destroy_all

p1 = Property.create! name: 'Auburn square', address: '35 Northumberland Rd, Auburn, NSW', price: 600000, rooms: 4, bathrooms: 2, garage: 1, image: 'https://rimh2.domainstatic.com.au/HZr3aMrP9Mq7iTc3CuIrbAiUsvQ=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/908badf3-fa63-490a-b843-06f04d91d7a2-w1440-h1080'
p2 = Property.create! name: 'River Realty', address: '36 Victoria Street, Mcmahons Point, NSW', price: 600000, rooms: 4, bathrooms: 2, garage: 2, image: 'https://rimh2.domainstatic.com.au/Yuovn_kxahV7G8OkPOw0Oab4QXM=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016405420_1_1_200728_073453-w4000-h2667'
p3 = Property.create! name: 'Malvern Avenue', address: '49 Malvern Avenue, Manly NSW 2095', price: 600000, rooms: 4, bathrooms: 2, garage: 2, image: 'https://rimh2.domainstatic.com.au/hzVJfNiBmvhAjMwTSGvsewfxw6U=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016388660_1_1_200721_023310-w1600-h1200'
p4 = Property.create! name: 'Robertson Park Avenue', address: '247 Lambert Road Indooroopilly QLD 4068
', price: 2000000, rooms: 4, bathrooms: 2, garage: 3, image: 'https://rimh2.domainstatic.com.au/3XKhcljObekwUkQ-fCl6uIzMK_M=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016421009_1_1_200805_053452-w1600-h1200'

puts "created #{Property.count} properties."

User.destroy_all

u1 = User.create! email: 'kart@ga.com', password: 'chicken', name: 'Kart', admin: true
u2 = User.create! email: 'baga@ga.com', password: 'chicken', name: 'Bagavathi'
u3 = User.create! email: 'geet@ga.com', password: 'chicken', name: 'Geet'

puts "Created #{User.count} users."

u1.properties << p1 << p3 << p4
u2.properties << p2

print "User #{User.first.name} has properties:"
puts User.first.properties.pluck(:name).join(',')

Broker.destroy_all

b1 = Broker.create! mailid: 'matt@ga.com', name: 'Matt', agency: 'Belle Property', phno: '0411233453', image: 'https://img-cdn.tid.al/o/18dbd99c8f8166cb175c39506e15aa643856f4f0.jpg'
b2 = Broker.create! mailid: 'Peet@ga.com', name: 'Peet', agency: 'Strathfield Property', phno: '0411231243', image: 'https://img-cdn.tid.al/o/18dbd99c8f8166cb175c39506e15aa643856f4f0.jpg'
b3 = Broker.create! mailid: 'charles@ga.com', name: 'Charles', agency: 'Belle Property', phno: '0423003453', image: 'https://img-cdn.tid.al/o/18dbd99c8f8166cb175c39506e15aa643856f4f0.jpg'
b4 = Broker.create! mailid: 'josh@ga.com', name: 'Josh', agency: 'Paramatta Agency', phno: '0411235678', image: 'https://img-cdn.tid.al/o/18dbd99c8f8166cb175c39506e15aa643856f4f0.jpg'

puts "Created #{Broker.count} brokers."

b1.properties << p1 << p3
b2.properties << p2

print "User #{Broker.first.name} who works for #{Broker.first.agency} deals with the following properties:"
puts Broker.first.properties.pluck(:name).join(',')
