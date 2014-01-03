class Post < ActiveRecord::Base
  belongs_to :user

  has_many :items, -> { order('number ASC') }
  has_many :comments, as: :commentable

  has_many :like_relationships, dependent: :destroy
  has_many :likers, source: :user, through: :like_relationships

  accepts_nested_attributes_for :items, allow_destroy: true

  def likes
    likers.count
  end

  def self.scope(params, current_user)
    if params[:channel] == 'Following'
      posts = Post.where(user_id: current_user.followed_users).references(:users)
    else
      posts = Post.all
    end
  end
end
