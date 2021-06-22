class Chatroom < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :user

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
end
