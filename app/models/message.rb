class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :messenger, polymorphic: true
end
