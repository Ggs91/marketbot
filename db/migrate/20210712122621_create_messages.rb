class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chatroom, foreign_key: true, index: true
      t.text :content

      t.timestamps
    end
  end
end
