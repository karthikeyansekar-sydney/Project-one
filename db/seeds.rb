puts "Creating properties"

Property.destroy_all

p1 = Property.create! name: 'Auburn square', address: '35, Northumberland Rd, Auburn, NSW', price: 600000, rooms: 3, bathrooms: 2, garage: 1, image: 'https://rimh2.domainstatic.com.au/HZr3aMrP9Mq7iTc3CuIrbAiUsvQ=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/908badf3-fa63-490a-b843-06f04d91d7a2-w1440-h1080'
p2 = Property.create! name: 'River Realty', address: '36, Victoria Street, Mcmahons Point, NSW', price: 600000, rooms: 4, bathrooms: 2, garage: 2, image: 'https://rimh2.domainstatic.com.au/Yuovn_kxahV7G8OkPOw0Oab4QXM=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016405420_1_1_200728_073453-w4000-h2667'
p3 = Property.create! name: 'Malvern Avenue', address: '49, Malvern Avenue, Manly, NSW 2095', price: 600000, rooms: 2, bathrooms: 2, garage: 2, image: 'https://rimh2.domainstatic.com.au/hzVJfNiBmvhAjMwTSGvsewfxw6U=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016388660_1_1_200721_023310-w1600-h1200'
p4 = Property.create! name: 'Robertson Park Avenue', address: '247, Lambert Road, Indooroopilly, QLD 4068
', price: 2000000, rooms: 4, bathrooms: 3, garage: 3, image: 'https://rimh2.domainstatic.com.au/3XKhcljObekwUkQ-fCl6uIzMK_M=/fit-in/1920x1080/filters:format(jpeg):quality(80):no_upscale()/http://b.domainstatic.com.au.s3-website-ap-southeast-2.amazonaws.com/2016421009_1_1_200805_053452-w1600-h1200'

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
b2 = Broker.create! mailid: 'Peet@ga.com', name: 'Peet', agency: 'Strathfield Property', phno: '0411231243', image: 'https://images.squarespace-cdn.com/content/v1/560ee0e1e4b095574c38f56e/1464547365674-4ZCBPD5ZMM2M9JMHXEWG/ke17ZwdGBToddI8pDm48kA57psLcJ0KzoacvYg9C0uJZw-zPPgdn4jUwVcJE1ZvWhW7QUl7Hlx1Ovi-Ue4YINkJFbgE-7XRK3dMEBRBhUpxhPjOCAs8IFeJyjCSdDFafgAX2bzmz_KFYnAi2-Hv4xS8kYZViurNA_T6eBmOHyxg/ThousandOaks-Malibu-Calabasas-Executive-Portrait-Business-Headshot-KarenVaisman-Photography.jpg?format=1500w'
b3 = Broker.create! mailid: 'charles@ga.com', name: 'Charles', agency: 'Belle Property', phno: '0423003453', image: 'https://images.squarespace-cdn.com/content/v1/5aee389b3c3a531e6245ae76/1526916905349-R9JQ5EY0X8TMBV2879TI/ke17ZwdGBToddI8pDm48kJUlZr2Ql5GtSKWrQpjur5t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfNdxJhjhuaNor070w_QAc94zjGLGXCa1tSmDVMXf8RUVhMJRmnnhuU1v2M8fLFyJw/DBS_AlexAnderson_4263.jpg'
b4 = Broker.create! mailid: 'josh@ga.com', name: 'Josh', agency: 'Paramatta Agency', phno: '0411235678', image: 'https://images.squarespace-cdn.com/content/v1/592738c58419c2fe84fbdb81/1518946156123-Y7ZIHA4WSMT07H59S81T/ke17ZwdGBToddI8pDm48kIKay4bYLpKTFWoXFdGxjdZ7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmo3_5ncHsS_KC884-Z46vJXn_CAy8A416_wq-2ydr5e5Si7pbxezXfOOzs3720f9z/DwayneBrownStudio_Kevin_Ottawa_LinkedIn_Portrait.jpg?format=500w'

puts "Created #{Broker.count} brokers."

b1.properties << p1
b2.properties << p2
b3.properties << p4
b2.properties << p3


print "Broker #{Broker.first.name} who works for #{Broker.first.agency} deals with the following properties:"
puts Broker.first.properties.pluck(:name).join(',')
