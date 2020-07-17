class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  scope :user_rooms, ->(user) { user.rooms.includes(:users).order(last_message: :desc) }

  def side_user(user)
    users = self.users.uniq
    if users[0] == user
      users[1]
    else
      users[0]
    end
  end
end
