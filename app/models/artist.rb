class Artist < ApplicationRecord
  GENRES = %w[Jazz Rock Indie Pop Blues Punk Funk Reggae Soul Rap Metal Electronic Classical Folk]
  ROLES = %w[Singer Guitarist Drummer Bassist Keyboardist Composer Remixer Songwriter Producer DJ]

  INFLUENCES = [
    {
      name: 'Florence + The Machine', image: 'https://dynamicmedia.livenationinternational.com/Media/k/t/n/9cc3e38c-66b0-4160-8859-0feb42352add.jpg'
    },
    {
      name: 'Phoebe Bridgers', image: 'https://media.resources.festicket.com/www/artists/phoebe-bridgers-cover-story-interview.jpg'
    },
    {
      name: 'Erykah Badu', image: 'https://www.clubbingspain.com/imagenes/Erykah-Badu-2015-1200.jpg'
    },
    {
      name: 'Rage Against The Machine', image: 'https://www.rollingstone.com/wp-content/uploads/2020/02/Rage.jpg?resize=1800,1200&w=1800'
    },
    {
      name: 'Paramore', image: 'https://indiehoy.com/wp-content/uploads/2018/09/paramore.jpg'
    },
    {
      name: 'Cranberries', image: 'https://loff.it/wp-content/uploads/2018/01/loffit-muere-dolores-oriordan-cantante-de-the-cranberries-02.jpg'
    },
    {
      name: 'PJ Harvey', image: 'https://img.discogs.com/TTbGEo9x9D31sKJSeYi6_GcscU0=/600x600/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-36052-1606316026-8044.jpeg.jpg'
    },
    {
      name: 'Patti Smith', image: 'https://note-store.es/upload/resize_cache/iblock/4ba/325_380_2/Patti-Smith.png'
    },
    {
      name: 'Fleetwood Mac', image: 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Fleetwood_Mac_Billboard_1977.jpg'
    },
    {
      name: 'Radiohead', image: 'https://mixfm.mx/wp-content/uploads/2018/07/creep-radiohead-video.jpg'
    }
  ]

  belongs_to :user
  belongs_to :label, optional: true
  has_many :events, as: :organizable, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_one_attached :photo
  validates :user, uniqueness: true
  validates :name, presence: true

  validate :valid_genre_list
  validate :valid_role_list

  before_create :pull_spotify_image
  before_update :pull_spotify_image, :if => Proc.new { |model| model.influences_changed? }
  after_create :set_user_type

  # scope :filter_by_genre, ->(search_genre) { where("'#{search_genre}' = Any(genres)") }
  scope :filter_by_genres, ->(search_genres) { where("genres @> ARRAY[?]::varchar[]", search_genres) } # it will match only if all slected genres are present
  # scope :filter_by_role, ->(search_role) { where("'#{search_role}' = Any(roles)") }
  scope :filter_by_roles, ->(search_roles) { where("roles @> ARRAY[?]::varchar[]", search_roles) }
  scope :filter_by_location, ->(search_location) { where location: search_location }


  def influences_list
    INFLUENCES.map { |influence| influence[:name] }
  end

  def influence_image(influence)
    JSON.parse(influence)['image']
  end

  def influences_name_list
    influences.map { |influence| JSON.parse(influence)['name'] }
  end


  def set_user_type
    user.artist!
  end


  private

  def pull_spotify_image
    self.influences = influences.map do |influence|
      artists = RSpotify::Artist.search(influence)
      image = artists.first.images.first['url']

      {'name' => influence, 'image' => image}.to_json
    end
  end

  def valid_genre_list
    diff = genres - GENRES
    diff.empty?
  end

  def valid_role_list
    diff = roles - ROLES
    diff.empty?
  end
end
