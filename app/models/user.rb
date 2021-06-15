class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: [:label, :artist]

  has_one :artist
  has_one :label

  has_many :connections_as_user1, class_name: "Connection", foreign_key: :user1_id
  has_many :connections_as_user2, class_name: "Connection", foreign_key: :user2_id
  has_many :messages
  has_many :conversations
  has_many :posts


  def connections
    self.connections_as_user1 + self.connections_as_user2
  end
end
