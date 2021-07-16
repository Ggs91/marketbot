class Bot < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  def send_message(content, message_type, question=nil)
    self.messages.create(
      chatroom: self.chatroom,
      message_type: message_type,
      content: content,
      question: question
    )
  end

  def send_introduction_message(questionnaire_presentation)
    self.send_message(questionnaire_presentation, 'introduction')
  end

  def process_survey(questionnaire, completion)
    question_index = completion.current_question_index

    if completion.is_at_first_question?
      send_message('👌', 'question', questionnaire.questions[question_index])
    elsif completion.is_at_last_question?
      send_message('One last question 😁', 'question', questionnaire.questions[question_index])
      # completion.current_question_index = nil
    else
      send_message(nil, 'question', questionnaire.questions[question_index])
    end
  end
end
