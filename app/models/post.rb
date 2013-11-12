class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items
  #has_one :image
  has_many :comments, as: :commentable

  has_many :likes
  has_many :likers, class_name: 'User', through: :likes

  def likes
    likers.count
  end
end