class Chatroom < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :user
end
