class Artist < ApplicationRecord
  GENRES = %w(Jazz Rock Indie Pop Blues Punk Funk Reggae)
  ROLES = %w(Singer Guitarist Drummer Bassist Keyboardist)

  INFLUENCES = [
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

  belongs_to :user
  belongs_to :label, optional: true
  has_many :events, as: :organizable
  has_many :songs

  validate :valid_genre_list
  validate :valid_role_list

  def influences_list
    INFLUENCES.map {|influence| influence[:name]}
  end

  def influence_image(name)
    influence = INFLUENCES.find { |inf| inf[:name] == name }
    influence[:image]
  end

  private

  def valid_genre_list
    diff = genres - GENRES
    diff.empty?
  end

  def valid_role_list
    diff = roles - ROLES
    diff.empty?
  end

end
