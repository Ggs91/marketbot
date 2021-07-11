class ChatRoom < ApplicationRecord
  has_many :chat_messages
  has_many :messages, through: :chat_messages, source: :sendable, source_type: 'Message'
  has_many :questions, through: :chat_messages, source: :sendable, source_type: 'Question'
end
