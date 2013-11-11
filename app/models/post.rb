class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items
  #has_one :image
  has_many :comments, as: :commentable
  has_and_belongs_to_many :likers,
                          class_name: 'User',
                          join_table: 'likes'

  def likes
    likers.count
  end
end