class AddQuestionnaireToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :questionnaire, foreign_key: true, index: true
  end
end
