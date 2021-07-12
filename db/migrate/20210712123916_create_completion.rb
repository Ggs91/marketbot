class CreateCompletion < ActiveRecord::Migration[5.2]
  def change
    create_table :completions do |t|
      t.references :questionnaire, foreign_key: true, index: true

      t.timestamps
    end
  end
end
