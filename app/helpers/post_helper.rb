module PostHelper
  def like_button(post)
    if LikeRelationship.where(user_id: current_user, post_id: post).empty?
      render 'posts/like', post: post
    else
      render 'posts/unlike', post: post
    end
  end

  def masonry_like_button(post)
    if LikeRelationship.where(user_id: current_user, post_id: post).empty?
      render 'posts/masonry_like', post: post
    else
      render 'posts/masonry_unlike', post: post
    end
  end

  def cl_image_tag_with_crop post, options = {}
    html = cl_image_tag post.cloudinary_id, options.merge(quality: 95)
    raw html.sub('/upload/', "/upload/#{post.crop_str}")
  end
end
