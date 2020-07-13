class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, length: { minimum: 2 }, uniqueness: true, presence: true
end
