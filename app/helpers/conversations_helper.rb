module ConversationsHelper
  def the_other_person(conversation)
    return @the_other_person if @the_other_person.present?

    conversation.participants.each do |user|
      if user != current_user
        @the_other_person = user
        return @the_other_person
      end
    end
  end

  def has_unread?
    @has_unread ||= (current_user.unread_msg_count != '0')
  end
end
