class ItemCategoriesController < ApplicationController
  def show
    params[:sort] ||= 'Hot'
    @item_category = ItemCategory.find(params[:id])
    @posts = @item_category.posts
                           .sort(params[:sort])
                           .page(params[:page])
                           .per(20)
    render 'posts/index' if request.xhr?
  end
end
