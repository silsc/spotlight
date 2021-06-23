class Connection < ApplicationRecord
  belongs_to :user1, foreign_key: :user1_id, class_name: "User"
  belongs_to :user2, foreign_key: :user2_id, class_name: "User"

  validates :user1_id, presence: true
  validates :user2_id, presence: true

  def connection_suggestion
  end
end
