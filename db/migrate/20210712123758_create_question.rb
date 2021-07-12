class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :questionnaire, foreign_key: true, index: true
      t.references :messages, foreign_key: true, index: true
      t.string :name
      t.integer :question_type

      t.timestamps
    end
  end
end
