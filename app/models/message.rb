class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :question, optional: true
  belongs_to :sender, polymorphic: true

  enum message_type: { question: 0, answer: 1, reply: 2, introduction: 3 }

  def sender_type
    self.sender.is_a?(User) ? 'user' : 'bot'
  end
end
