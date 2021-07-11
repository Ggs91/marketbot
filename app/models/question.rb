class Question < ApplicationRecord
  has_one :chat_message, as: :sendable
  has_one :chat_room, through: :chat_messages
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }

  def self.question_type_select
    question_types.keys.map { |k| [k.titleize, k] }
  end
end
