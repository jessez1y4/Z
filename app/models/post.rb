class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items
  has_many :comments, as: :commentable

  has_many :like_relationships
  has_many :likers, class_name: 'User', through: :like_relationships

  def likes
    likers.count
  end
end
