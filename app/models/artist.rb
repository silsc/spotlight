class Artist < ApplicationRecord
  GENRES = %w(Jazz Rock Indie Pop Blues Punk Funk Reggae)
  ROLES = %w(Singer Guitarist Drummer Bassist Keyboardist)

  belongs_to :user
  belongs_to :label, optional: true
  has_many :events, as: :organizable
  has_many :songs
  has_one_attached :photo

  validate :valid_genre_list
  validate :valid_role_list

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
