class Bot < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_one :chatroom, dependent: :destroy
end
