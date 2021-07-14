class User < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  def send_message(chatroom, content, message_type='reply')
    self.messages.create(
      chatroom: chatroom,
      message_type: message_type,
      content: content
    )
  end
end
