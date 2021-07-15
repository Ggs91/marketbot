class Bot < ApplicationRecord
  has_many :messages, as: :sender, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  def listen(record)
    if record.is_a? Completion
      self.process_completion(record)
    elsif
      self.send_message()
    else
    end
  end

  def process_completion(completion)
    if completion.has_one_last_question_to_answer?
      # self.send_message('One last question', 'question', completion.)
      completion.current_question = nil
    end
  end

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

  def start_survey(questionnaire)
    send_message('👌', 'question', questionnaire.questions.first)
  end
end
