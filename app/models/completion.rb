class Completion < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  attr_writer :current_question

  def current_question
    @current_question || 1
  end

  def final_question
    self.questionnaire.questions_count
  end
end
