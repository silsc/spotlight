puts "Destroying all"

User.destroy_all
Artist.destroy_all
Label.destroy_all
Chatroom.destroy_all

puts "Creating artist influences"

# influences = [
#   {
#     name: 'Florence + The Machine', image: 'https://dynamicmedia.livenationinternational.com/Media/k/t/n/9cc3e38c-66b0-4160-8859-0feb42352add.jpg'
#   },
#   {
#     name: 'Phoebe Bridgers', image: 'https://media.resources.festicket.com/www/artists/phoebe-bridgers-cover-story-interview.jpg'
#   },
#   {
#     name: 'Erykah Badu', image:'https://www.clubbingspain.com/imagenes/Erykah-Badu-2015-1200.jpg'
#   },
#   {
#     name: 'Rage Against The Machine', image:'https://www.rollingstone.com/wp-content/uploads/2020/02/Rage.jpg?resize=1800,1200&w=1800'
#   },
#   {
#     name: 'Paramore', image:'https://indiehoy.com/wp-content/uploads/2018/09/paramore.jpg'
#   }
# ]

puts "Creating users, artist and label"

# user seeds
user = User.create!(email:'user_one@email.com', password:'password', username: 'user1', user_type: :artist)
puts 'user created'
user_2 = User.create!(email:'user_otwo@email.com', password:'password', username: 'user2', user_type: :label)
puts 'user-2 created'
user_3 = User.create!(email:'user_three@email.com', password:'password', username: 'user3', user_type: :label)
puts 'user-3 created'
user_4 = User.create!(email:'user_four@email.com', password:'password', username: 'user4', user_type: :artist)
puts 'user-4 created'
user_5 = User.create!(email:'user_five@email.com', password:'password', username: 'user5', user_type: :artist)
puts 'user-5 created'
user_6 = User.create!(email:'user_six@email.com', password:'password', username: 'user6', user_type: :artist)
puts 'user-6 created'
user_7 = User.create!(email:'user_seven@email.com', password:'password', username: 'user7', user_type: :artist)
puts 'user-7 created'
user_8 = User.create!(email:'user_eight@gmail.com', password:'password', username: 'user8', user_type: :artist)
puts 'user-8 created'
user_9 = User.create!(email:'user_nine@email.com', password:'password', username: 'user9', user_type: :artist)
puts 'user-9 created'
user_10 = User.create!(email:'user_ten@gmail.com', password:'password', username: 'user10', user_type: :label)
puts 'user-10 created'


# labels seeds
puts 'Creating labels'
avatar_sony = URI.open('https://yt3.ggpht.com/ytc/AAUvwnhsE_B7PvF48rXd6KCN3dvWktauEsmgHJAhR6pBGA=s900-c-k-c0x00ffffff-no-rj')
label_sony = Label.create!(user: user_2, name: 'Sony', location: 'New York', bio: 'At Sony Music Entertainment, we fuel the creative journey. We’ve played a pioneering role in music history, from the first-ever music label to the invention of the flat disc record. We’ve nurtured some of music’s most iconic artists and produced some of the most influential recordings of all time.', website_url: 'www.sony.com')
label_sony.photo.attach(io: avatar_sony, filename: 'sony.jpg', content_type: 'image/jpg')

avatar_uni = URI.open('https://industriamusical.es/wp-content/uploads/2014/02/universal-Music-Group.jpg')
label_uni = Label.create!(user: user_3, name: 'Universal', location: 'Los Angeles', bio: 'Universal Music Group (UMG) is the world leader in music-based entertainment, with a broad array of businesses engaged in recorded music, music publishing, merchandising and audiovisual content in more than 60 countries. Featuring the most comprehensive catalog of recordings and songs across every musical genre, UMG identifies and develops artists and produces and distributes the most critically acclaimed and commercially successful music in the world.', website_url: 'www.universal.com')
label_uni.photo.attach(io: avatar_uni, filename: 'uni.jpg', content_type: 'image/jpg')

avatar_dead = URI.open('https://yt3.ggpht.com/ytc/AAUvwnhoWtRyalZy1dbORu2gXcLa5sgfonXCxOHHZvS3=s900-c-k-c0x00ffffff-no-rj')
label_dead = Label.create!(user: user_10, name: 'Dead Oceans', location: 'Paris', bio: 'Dead Oceans is home to a staggering mix of artists that span genre, age, and sense of place. Dead Oceans’ troubador-twisting foundations endure in Phoebe Bridgers, Kevin Morby, Bill Fay and Fenne Lily; artists like Japanese Breakfast, Mitski, and Khruangbin bring fiery imaginations and breathtaking, intergalatic visions; Shame, Destroyer and Durand Jones & the Indications each rattle and hum in incomparable ways; and long-beloved artists like Slowdive and Bright Eyes have found a home here as well, returning to music with deep wells and exciting new ideas.', website_url: 'www.deadoceans.com')
label_dead.photo.attach(io: avatar_dead, filename: 'dead.jpg', content_type: 'image/jpg')


puts 'labels created'

# artists seeds
puts 'Creating artists'
avatar_biig = URI.open('https://www.nme.com/wp-content/uploads/2020/11/biigpiig.jpg')
artist_biig = Artist.create!(user: user_4, name: 'Biig Piig', age: 21, location: 'Dublin', label: label_sony, genres: ['Rock', 'Punk'], roles: ['Singer', 'Producer'], youtube_url: 'https://www.youtube.com/embed/kfWJHOeWZ6c', instagram_url: 'https://www.instagram.com/p/CPpqCiQhloV/', influences: ['The Cranberries','Oasis','Madonna','Dua Lipa'])
artist_biig.photo.attach(io: avatar_biig, filename: 'biig_piig.jpg', content_type: 'image/jpg')


avatar_danny = URI.open('https://lh3.googleusercontent.com/proxy/RWii2ivWHZZ2wKK3h4nAUl9XZxFy_LPcdnqkT8iiL82wjDDzhIaKWcLYo-uzCZBsJfQb8sZtnC6tMRiamo-ZsG5LRPWjrAU5lU4vjp26_jana1mCmHzrW2ENrykGAzU')
artist_danny = Artist.create!(user: user, name: 'Danny', age: 31, location: 'Glasgow', bio:'Scottish music lover 🏴󠁧󠁢󠁳󠁣󠁴󠁿, musician and producer living & working in London. Past lives in Amsterdam, Toronto and Brisbane. I also play in Probably Oslo with my friends Alex and Arran 👊', label: label_uni, genres: ['Rock', 'Indie'], roles: ['Drummer', 'Singer'], youtube_url: 'https://www.youtube.com/embed/EoebYwno2Dc', instagram_url: 'https://www.instagram.com/p/CK59blrMi_1/', influences: ['Arctic Monkeys','The Rapture','Nick Cave','The Beatles','Parcels'])
artist_danny.photo.attach(io: avatar_danny, filename: 'danny.jpg', content_type: 'image/jpg')

avatar_connie = URI.open('https://cdn2.thelineofbestfit.com/images/made/images/remote/https_cdn2.thelineofbestfit.com/media/2014/Connie_Constance_press_shot1_1290_1060.jpg')
artist_connie = Artist.create!(user: user_5, name: 'Connie Constance', age: 26, location: 'Watford', label: label_uni, genres: ['Soul'], roles: ['Singer'], youtube_url: 'https://www.youtube.com/embed/vTSYDB4CuwY', instagram_url: 'https://www.instagram.com/p/CP3X-1gs5N9/', influences: ['Amy Winehouse','Florence + The Machine','Aretha Franklin','Joy Crookes'])
artist_connie.photo.attach(io: avatar_connie, filename: 'connie.jpg', content_type: 'image/jpg')

avatar_conan = URI.open('https://i.guim.co.uk/img/media/53dacdc6b3b532836f8cde54512d6c641db09fca/0_70_4164_2498/master/4164.jpg?width=700&quality=85&auto=format&fit=max&s=7a13cae0f5eb567574ce2edcfeaf545a')
artist_conan = Artist.create!(user: user_6, name: 'Conan Osiris', age: 32, location: 'Lisbon', label: label_sony, genres: ['Funk', 'Electronic'], roles: ['Singer', 'Remixer'], youtube_url: 'https://www.youtube.com/embed/zwiuIfBOWOA', instagram_url: 'https://www.instagram.com/p/CQOSvGtpHTo/', influences: ['Amália Rodrigues','ROSALÍA','Branko','Bad Bunny','Blaya'])
artist_conan.photo.attach(io: avatar_conan, filename: 'conan.jpg', content_type: 'image/jpg')

avatar_yonaka = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ3RoSpdmL89XUxgvKl4qZHwrJYNBUhIZ9Zw&usqp=CAU')
artist_yonaka = Artist.create!(user: user_7, name: 'Yonaka', location: 'Amsterdam', label: label_uni, genres: ['Rock', 'Indie'], roles: ['Singer', 'Bassist', 'Guitarist'], youtube_url: 'https://www.youtube.com/embed/csVhNAEmacE', instagram_url: 'https://www.instagram.com/p/CQbkGhcH4X1/')
artist_yonaka.photo.attach(io: avatar_yonaka, filename: 'yonaka.jpg', content_type: 'image/jpg')

avatar_ze = URI.open('https://i1.sndcdn.com/avatars-1loSeJ6XF8M7z8CJ-VzNOlQ-t240x240.jpg')
artist_ze = Artist.create!(user: user_8, name: 'Zé Trigueiros', location: 'Lisbon', genres: ['Blues', 'Indie'], roles: ['Singer', 'Drummer'], youtube_url: 'https://www.youtube.com/embed/8toEj6QbGU0', instagram_url: 'https://www.instagram.com/p/CN1kob7Mj0O/')
artist_ze.photo.attach(io: avatar_ze, filename: 'ze.jpg', content_type: 'image/jpg')

avatar_shung = URI.open('https://static.miraheze.org/maiasongcontestwiki/thumb/e/ed/Shungudzo.jpg/300px-Shungudzo.jpg')
artist_shung = Artist.create!(user: user_9, name: 'Shungudzo', location: 'Hawaii', genres: ['Pop', 'Indie'], roles: ['Singer', 'Songwriter'], youtube_url: 'https://www.youtube.com/embed/eKd_iNZeqS8', instagram_url: 'https://www.instagram.com/p/CQbbFJWHlVZ/')
artist_shung.photo.attach(io: avatar_shung, filename: 'shung.jpg', content_type: 'image/jpg')


puts 'artists created'

puts "Creating chatrooms and conversations"

chatroom_1 = Chatroom.create!(user: user)
puts 'Chatroom1 created'
chatroom_2 = Chatroom.create!(user: user_2)
puts 'Chatroom2 created'
chatroom_3 = Chatroom.create!(user: user)
puts 'Chatroom2 created'

conversation_1 = Conversation.create!(chatroom: chatroom_1 , user: user_4) #artist-artist chat
puts 'Conversation1 created'
conversation_2 = Conversation.create!(chatroom: chatroom_2 , user: user_3) #label-label chat
puts 'Conversation2 created'
conversation_3 = Conversation.create!(chatroom: chatroom_3 , user: user_2) #artist-label chat
puts 'Conversation3 created'

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





