class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_many_attached :files

  def isliked?(user)
    !likes.where(user_id: user.id).empty?
  end
end
