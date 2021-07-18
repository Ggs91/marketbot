class AnswersResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :answers_reponses, id: false do |t|
      t.belongs_to :answer, index: true
      t.belongs_to :response, index: true
    end
  end
end
