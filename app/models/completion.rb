class Completion < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers
  belongs_to :chatroom
  accepts_nested_attributes_for :answers, allow_destroy: true

  attr_writer :current_question

  def current_question
    @current_question || 1
  end

  def has_one_last_question_to_answer?
    self.questionnaire.questions_count == @current_question
  end
end
