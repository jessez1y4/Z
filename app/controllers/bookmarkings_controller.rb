class BookmarkingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @tag = Tag.find(params[:bookmarking][:tag_id])
    current_user.bookmark!(@tag)

    respond_to do |format|
      format.html { redirect_to @tag }
      format.js
    end
  end

  def destroy
    @tag = Bookmarking.find(params[:id]).tag
    current_user.unbookmark!(@tag)

    respond_to do |format|
      format.html { redirect_to @tag }
      format.js
    end
  end
end
