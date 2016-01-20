# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Initialize Agent account

u = User.where(username:"Hoseong A. Lee")[0]
u.usertype = 1
u.save

# Initialize Admin account

u = User.new
u.id = 2
u.username = "The Miami Markets"
u.provider = "ohpyupi"
u.usertype = 2
u.save

# [Sample] Bicycle share

p = Post.new
p.user_id = 2
p.category = "Bicycles"
p.title = "[SAMPLE] very cheap bicycle"
p.content = "[SAMPLE]

I used this bicycle for my exercise. The condition is not that great,
but it still works. Just 30 dollars. I live nearby Kroger. So when selling this,
I want to meet you there. 
"
p.save


# [Sample] Rent share

p = Post.new
p.user_id = 2
p.category = "Rent/Housing"
p.title = "[SAMPLE] Looking for a house?"
p.content = "[SAMPLE]

Hi. My name is Steve. My room mate got a job, and he left.
So I have a room in my rent house. It's contraction finishes July 2016.
500 dollars a month, and utility fees are included.
Email me. I can tell you more!

rentman@miamioh.edu
"
p.save


# [Sample] Books

p = Post.new
p.user_id = 2
p.category = "Second hands"
p.title = "[SAMPLE] Quantum Mechanics by Shankar"
p.content = "[SAMPLE]

Hi. I have quantum mechanics book with fairly good condition.
It was 100 dollars when buying. I'd like to sell it only $40. No trade.

physicsman@miamioh.edu
"
p.save


# [Sample] 2008 Hyundai Elantra with low mileage

p = Post.new
p.user_id = 2
p.category = "Cars/Trucks"
p.title = "[SAMPLE] 2008 Hyundai Elantra with low mileage"
p.content = "[SAMPLE]
I leave Oxford soon, and I'd like to sell my neat car with only 8000 dollars.
VIN: 01234567890123456789a
Transmission: automatic
Odometer: 11300 miles
Title: clean
Type: sedan
My email is goodman@miamioh.edu. Please send me message, or leave comments if you are interested in. Thank you"
p.save

# Rules when visiting the Miami Markets
p = Post.new
p.user_id = 2
p.category = "Notice"
p.title = "Rules when visiting the miami markets."
p.content = "Hello, thank you for visiting the miami markets.
For good atmosphere of the markets, I'd like to tell you some rules.
<strong>Your posts or comments could be deleted by the markets in case of;</strong>

(1) uploading posts of comments that are totally not related to that of the markets.
(2) containg some sexual or aggressive words, sentences, or images. 
(3) criticizing any other people without proper base. 

<strong>Moreover, you account can be permanently banned from the market in case of;</strong>
(1) any actions listed above. 
(2) repeated actions listed above. 
(3) anything that seems fairly unproper. Please notice that all are your friends in Oxford :D
 
Thank you"
p.save


