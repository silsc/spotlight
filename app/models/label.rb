class Label < ApplicationRecord
  belongs_to :user
  has_many :events, as: :organizable
  has_many :artists
  has_one_attached :photo

  # include PgSearch::Model
  # pg_search_scope :label_search
  # multisearchable against: [:name, :location],
  # using: {
  #   tsearch: { prefix: true }
  # }
end
