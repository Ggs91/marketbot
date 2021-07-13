class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :questionnaire
  belongs_to :bot
  belongs_to :user

  after_create :set_name

  private

  def set_name
    self.update(name: "Chatroom ##{self.id}")
  end
end
