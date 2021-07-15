class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :questionnaire
  has_one :completion
  belongs_to :bot
  belongs_to :user

  after_create :set_name, :send_bot_introduction_message

  private

  def set_name
    self.update(name: "Chatroom ##{self.id}")
  end

  def send_bot_introduction_message
    self.bot.send_introduction_message(self.questionnaire.presentation)
  end
end
