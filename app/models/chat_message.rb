class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  belongs_to :sendable, polymorphic: true
end
