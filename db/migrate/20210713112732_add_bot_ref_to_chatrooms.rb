class AddBotRefToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :bot, index: true
    add_foreign_key :chatrooms, :bots
  end
end
