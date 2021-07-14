class AddQuestionRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :question, foreign_key: true
  end
end
