class Label < ApplicationRecord
  belongs_to :user
  has_many :events, as: :organizable
  has_many :artists
end
