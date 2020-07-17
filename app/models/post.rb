class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :text, length: { minimum: 4 }, presence: true

  def isliked?(user)
    !likes.where(user_id: user.id).empty?
  end
end
