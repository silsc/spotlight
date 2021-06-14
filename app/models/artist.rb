class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :label, optional: true
  has_many :events, as: :organizable
end
