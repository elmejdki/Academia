class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  has_one_attached :avatar
  has_one_attached :cover_picture

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id'

  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :rooms, through: :messages

  def followings_and_own_posts
    users = followings.map{ |f| f.followed }
    Post.where(author: users).or(Post.where(author: self)).includes(:author, { comments: :user }, :likes).order(created_at: :desc)
  end

  def follower?(user)
    self.followers.where(follower_id: user.id).count > 0
  end

  def following?(user)
    self.followings.where(followed_id: user.id).count > 0
  end

  def out_users
    User.all.order(created_at: :desc).filter{ |user| !self.following?(user) && self != user }[0..10]
  end

  def all_out_users
    User.all.order(created_at: :desc).filter{ |user| !self.following?(user) && self != user }
  end

  def followed_by
    self.followers.limit(1).first
  end
end
