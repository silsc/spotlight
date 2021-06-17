puts "Destroying all"

User.destroy_all
Artist.destroy_all
Label.destroy_all

puts "Creating artist influences"

influences = [
  {
    name: 'Florence + The Machine', image: 'https://dynamicmedia.livenationinternational.com/Media/k/t/n/9cc3e38c-66b0-4160-8859-0feb42352add.jpg'
  },
  {
    name: 'Phoebe Bridgers', image: 'https://media.resources.festicket.com/www/artists/phoebe-bridgers-cover-story-interview.jpg'
  },
  {
    name: 'Erykah Badu', image:'https://www.clubbingspain.com/imagenes/Erykah-Badu-2015-1200.jpg'
  },
  {
    name: 'Rage Against The Machine', image:'https://www.rollingstone.com/wp-content/uploads/2020/02/Rage.jpg?resize=1800,1200&w=1800'
  },
  {
    name: 'Paramore', image:'https://indiehoy.com/wp-content/uploads/2018/09/paramore.jpg'
  }
]

puts "Creating users, artist and label"

user = User.create!(email:'user_one@emailcom', password:'password', username: 'user1')
puts 'user created'
user_2 = User.create!(email:'user_otwo@emailcom', password:'password', username: 'user2')
puts 'user-2 created'


label = Label.create!(user: user_2, name: 'Sony', location: 'Brussels', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', website_url: 'www.sony.com')
puts 'label Sony created'

artist = Artist.create!(name: 'Biig Piig', age: 21, location: 'Dublin', user: user, label: label, genres: "Rock", influences: )
puts 'artist created'
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





