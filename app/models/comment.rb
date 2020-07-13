class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post


  validates :body, length: { minmum: 2 }, uniqueness: true, presence: true
end
