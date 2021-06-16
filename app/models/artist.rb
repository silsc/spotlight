class Artist < ApplicationRecord
  GENRES = %W(Jazz Rock Indie Pop)

  belongs_to :user
  belongs_to :label, optional: true
  has_many :events, as: :organizable
  has_many :songs

  validate :valid_genre_list

  private

  def valid_genre_list
    diff = genres - GENRES
    diff.empty?
  end
end
