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
end
