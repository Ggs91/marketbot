class User < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
end
