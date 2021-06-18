class Song < ApplicationRecord
  belongs_to :artist
  has_one_attached :track
end
