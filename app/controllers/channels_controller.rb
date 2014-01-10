class ChannelsController < ApplicationController
  def show
    params[:sort] ||= 'Hot this month'
    @channel = Channel.find(params[:id])
    @posts = @channel.posts.sort(params[:sort]).page(params[:page]).per(1)
    render 'posts/index_grid' if request.xhr?
  end

  def index
    @channels = Channel.all
  end

  def new
    @channel = Channel.new(creator_id: current_user.id)
  end

  def create
    @channel = Channel.new(channel_params)
    if @channel.save
      current_user.join! @channel # creator is also a member
      redirect_to @channel
    else
      render 'new'
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name, :description, :creator_id)
  end
end
