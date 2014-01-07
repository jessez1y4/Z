class ChannelMembershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @channel = Channel.find(params[:channel_membership][:channel_id])
    current_user.join!(@channel)

    respond_to do |format|
      format.html { redirect_to channel_posts_url(@channel) }
      format.js { @channel.reload }
    end
  end

  def destroy
    @channel = ChannelMembership.find(params[:id]).channel
    current_user.leave!(@channel)

    respond_to do |format|
      format.html { redirect_to channel_posts_url(@channel) }
      format.js { @channel.reload }
    end
  end
end
