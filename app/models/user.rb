class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  has_one_attached :avatar
  has_one_attached :cover_picture

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'

  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'

  def follower?(user)
    self.followers.where(follower_id: user.id).count > 0
  end

  def following?(user)
    self.followings.where(followed_id: user.id).count > 0
  end

  def out_users
    User.all.filter{ |user| !self.following?(user) && self != user }
  end

  def followed_by
    self.followers.limit(1)
  end
end
