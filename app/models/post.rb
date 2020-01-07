class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes
  has_many :lists
end
