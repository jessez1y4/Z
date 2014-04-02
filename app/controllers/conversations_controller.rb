class ConversationsController < ActionController::Base
  before_filter :authenticate_user!

  layout 'application'

  def index
  end

  def show
    if conversation.is_unread?(current_user)
      conversation.mark_as_read(current_user)
    end
  end

  def create
    if params[:title].present? && params[:user_id].present? && params[:body].present?
      receiver = User.find(params[:user_id])
      current_user.send_message receiver, params[:body], params[:title]
      redirect_to(receiver, notice: 'Message sent.') and return
    end

    redirect_to receiver, notice: 'Failed to send message.'
  end

  def reply
    if params[:message][:body].present?
      current_user.reply_to_conversation(conversation, params[:message][:body])
      redirect_to conversation
    else
      redirect_to conversation, notice: 'Message is empty.'
    end
  end

  def delete
    conversation.move_to_trash(current_user)

    redirect_to conversations_path
  end

  def undelete
    conversation.untrash(current_user)

    redirect_to conversations_path
  end

  private

  def conversation
    @conversation ||= Conversation.find(params[:id])
  end
end
