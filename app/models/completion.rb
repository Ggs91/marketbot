class Completion < ApplicationRecord
  attr_writer :current_question_index

  belongs_to :questionnaire
  has_many :answers
  belongs_to :chatroom

  def current_question_index
    @current_question_index || 0
  end

  def is_at_first_question?
    self.current_question_index == 0
  end

  def is_at_last_question?
    self.questionnaire.questions_count == current_question_index + 1
  end
end
