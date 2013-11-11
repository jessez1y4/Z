class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items
  #has_one :image
  has_many :comments, as: :commentable
end