class Message < ApplicationRecord
  has_one :chat_message, as: :sendable
  has_one :chat_room, through: :chat_messages
end
