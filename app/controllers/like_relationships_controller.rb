class LikeRelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = Post.find(params[:like_relationship][:post_id])
    current_user.like!(@post)

    respond_to do |format|
      format.html { redirect_to @post }
      format.js { @post.reload }
    end
  end

  def destroy
    @post = LikeRelationship.find(params[:id]).post
    current_user.unlike!(@post)

    respond_to do |format|
      format.html { redirect_to @post }
      format.js { @post.reload }
    end
  end
end
