module ChannelsHelper
  def join_button channel
    if ChannelMembership.where(user_id: current_user, channel_id: channel).empty?
      render 'channels/join', channel: channel
    else
      render 'channels/leave', channel: channel
    end
  end
end
