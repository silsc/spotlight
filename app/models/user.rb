class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: %i[Label Artist]

  has_one :artist, dependent: :destroy
  has_one :label, dependent: :destroy

  has_many :connections_as_user1, class_name: "Connection", foreign_key: :user1_id
  has_many :connections_as_user2, class_name: "Connection", foreign_key: :user2_id
  has_many :messages
  has_many :conversations
  has_many :posts

  def connections
    connections_as_user1 + connections_as_user2
  end
end
