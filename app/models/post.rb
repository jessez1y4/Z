class Post < ActiveRecord::Base
  acts_as_commentable

  belongs_to :user

  has_many :items, order: 'number ASC'

  has_many :like_relationships
  has_many :likers, source: :user, through: :like_relationships

  accepts_nested_attributes_for :items, allow_destroy: true

  def likes
    likers.count
  end
end
