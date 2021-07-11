class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :question, foreign_key: true, index: true
      t.belongs_to :completion, foreign_key: true, index: true
      t.string :name

      t.timestamps
    end
  end
end
