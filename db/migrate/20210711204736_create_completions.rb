class CreateCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :completions do |t|
      t.belongs_to :questionnaire, foreign_key: true, index: true

      t.timestamps
    end
  end
end
