class CreateQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :name
      t.string :presentation

      t.timestamps
    end
  end
end
