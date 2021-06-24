class Chatroom < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :user
  has_many :users, through: :conversations

  def get_other_user
    user = conversations.first.user
    if user.artist?
      user.artist
    else
      user.label
    end

  end

  def get_other_user_name
    get_other_user.name
  end

  def get_other_user_photo
    get_other_user.photo
  end

  # users -> users who got contacted
  # user -> user who created the chatroom
  def get_others_users(current_user)
    users.to_a + [user] - [current_user]
  end
end
