class Bot < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  def send_introduction_message
    self.messages.create(
      chatroom: self.chatroom,
      content: introduction_message
    )
  end

  private

  def introduction_message
    "Hello"
  end
end
