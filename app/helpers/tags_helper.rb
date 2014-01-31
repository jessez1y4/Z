module TagsHelper
  def bookmark_button(tag)
    if Bookmarking.where(user_id: current_user, tag_id: tag.id).empty?
      render 'tags/bookmark', tag: tag
    else
      render 'tags/unbookmark', tag: tag
    end
  end
end
