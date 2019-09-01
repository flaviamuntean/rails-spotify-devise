module ApplicationHelper
  def fetch_recipient(conversation)
    if conversation.sender_id == current_user.id || conversation.recipient_id == current_user.id
      if conversation.sender_id == current_user.id
        recipient = User.find(conversation.recipient_id)
      else
        recipient = User.find(conversation.sender_id)
      end
    end
    return recipient
  end
end
