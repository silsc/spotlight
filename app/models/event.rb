class Event < ApplicationRecord
  belongs_to :organizable, polymorphic: true

  validates :date, presence: true
  validates :event_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
