class AddChatroomRefToCompletions < ActiveRecord::Migration[5.2]
  def change
    add_reference :completions, :chatroom, foreign_key: true
  end
end
