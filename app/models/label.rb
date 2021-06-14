class Label < ApplicationRecord
  belongs_to :user
  has_many :events, as: :organizable
end
