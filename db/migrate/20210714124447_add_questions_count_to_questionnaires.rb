class AddQuestionsCountToQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :questions_count, :integer
  end
end
