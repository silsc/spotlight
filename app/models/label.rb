class Label < ApplicationRecord
  belongs_to :user
  has_many :events, as: :organizable
  has_many :artists, dependent: :destroy
  has_one_attached :photo
  scope :filter_by_location, -> { where location: location }

  validates :user, uniqueness: true
  validates :name, presence: true
end
