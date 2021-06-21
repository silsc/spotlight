class Event < ApplicationRecord
  belongs_to :organizable, polymorphic: true

  validates :date, presence: true
end
