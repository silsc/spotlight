class Event < ApplicationRecord
  belongs_to :organizable, polymorphic: true
end
