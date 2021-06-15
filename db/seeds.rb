puts "Destroying all"

User.destroy_all
Artist.destroy_all
Label.destroy_all

puts "Creating users, artist and label"

user = User.create!(email:'user_one@emailcom', password:'password', username: 'user1')
user_2 = User.create!(email:'user_otwo@emailcom', password:'password', username: 'user2')

label = Label.create!(user: user_2, name: 'Sony', location: 'Brussels', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', website_url: 'www.sony.com')
artist = Artist.create!(name: 'Biig Piig', age: 21, location: 'Dublin', user: user, label: label)
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
