class MessagesController < ActionController::Base
  before_filter :authenticate_user!

  def create
    if params[:title].present? && params[:user_id].present? && params[:body].present?
      receiver = User.find(params[:user_id])
      current_user.send_message receiver, params[:body], params[:title]
      redirect_to(receiver, notice: 'Message sent.') and return
    end

    redirect_to receiver, notice: 'Failed to send message.'
  end
end
