class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :question, foreign_key: true, index: true
      t.references :completion, foreign_key: true, index: true


      t.timestamps
    end
  end
end
