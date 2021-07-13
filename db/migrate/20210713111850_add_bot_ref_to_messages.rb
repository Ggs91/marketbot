class AddBotRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :bot, index: true
    add_foreign_key :messages, :bots
  end
end
