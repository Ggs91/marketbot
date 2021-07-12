class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :questionnaire

  after_create :set_name

  private

  def set_name
    self.update(name: "Chatroom ##{self.id}")
  end
end
