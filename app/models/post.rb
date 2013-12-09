class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items
  has_many :comments, as: :commentable

  has_many :like_relationships
  has_many :likers, source: :user, through: :like_relationships

  def likes
    likers.count
  end
end
