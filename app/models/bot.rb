class Bot < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  # def listen(message_ou_autre)
  #   if
  #   elsif
  #     self.send_message()
  #   else
  #   end
  # end

  def send_message(content, message_type)
    self.messages.create(
      chatroom: self.chatroom,
      message_type: message_type,
      content: content
    )
  end

  def send_introduction_message(questionnaire_presentation)
    self.send_message(questionnaire_presentation, 'introduction')
  end
end
