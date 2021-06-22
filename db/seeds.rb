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

user = User.create!(email:'user_one@email.com', password:'password', username: 'user1', user_type: :artist)
puts 'user created'
user_2 = User.create!(email:'user_otwo@email.com', password:'password', username: 'user2', user_type: :label)
puts 'user-2 created'
user_3 = User.create!(email:'user_three@email.com', password:'password', username: 'user3', user_type: :label)
puts 'user-3 created'
user_4 = User.create!(email:'user_four@email.com', password:'password', username: 'user4', user_type: :artist)
puts 'user-4 created'


puts 'Creating labels'
label_1 = Label.create!(user: user_2, name: 'Sony', location: 'Brussels', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', website_url: 'www.sony.com')
label_2 = Label.create!(user: user_3, name: 'Universal', location: 'Brussels', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', website_url: 'www.universal.com')
puts 'label created'

# artists seeds
puts 'Creating artists'
avatar_biig = URI.open('https://www.nme.com/wp-content/uploads/2020/11/biigpiig.jpg')
artist_biig = Artist.create!(user: user_4, name: 'Biig Piig', age: 21, location: 'Dublin', label: label_1, genres: ['Rock', 'Punk'], roles: ['Singer'], youtube_url: 'https://www.youtube.com/embed/kfWJHOeWZ6c', instagram_url: 'https://www.instagram.com/p/CPpqCiQhloV/', influences: ['Oasis','Madonna','Dua Lipa'])
artist_biig.photo.attach(io: avatar_biig, filename: 'biig_piig.jpg', content_type: 'image/jpg')


avatar_danny = URI.open('https://lh3.googleusercontent.com/proxy/RWii2ivWHZZ2wKK3h4nAUl9XZxFy_LPcdnqkT8iiL82wjDDzhIaKWcLYo-uzCZBsJfQb8sZtnC6tMRiamo-ZsG5LRPWjrAU5lU4vjp26_jana1mCmHzrW2ENrykGAzU')
artist_danny = Artist.create!(user: user, name: 'Danny', age: 31, location: 'Glasgow', label: label_2, genres: ['Folk', 'Country'], roles: ['Drummer', 'Singer'], youtube_url: 'https://www.youtube.com/embed/EoebYwno2Dc', instagram_url: 'https://www.instagram.com/p/CK59blrMi_1/')
artist_danny.photo.attach(io: avatar_danny, filename: 'danny.jpg', content_type: 'image/jpg')


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





