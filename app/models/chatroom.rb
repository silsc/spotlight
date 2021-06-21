class Chatroom < ApplicationRecord
  has_many :conversations
  has_many :messages, dependent: :destroy
  belongs_to :user
end
