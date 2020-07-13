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

  validates :username, length: { in: 3..20 }, uniqueness: true, presence: true
  validates :fullname, length: { in: 6..30 }, presence: true
  validates :email, length: { in: 10..50 }, uniqueness: true, presence: true

  def followings_and_own_posts
    users = followings.map(&:followed)
    Post.where(author: users).or(Post.where(author: self)).includes(
      :author, { comments: :user }, :likes
    ).order(created_at: :desc)
  end

  def follower?(user)
    followers.where(follower_id: user.id).count.positive?
  end

  def following?(user)
    followings.where(followed_id: user.id).count.positive?
  end

  def all_out_users
    User.all.order(created_at: :desc).filter { |user| !following?(user) && self != user }
  end

  def out_users
    all_out_users[0..10]
  end

  def followed_by
    followers.limit(1).first
  end
end
