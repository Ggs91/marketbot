class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :sendable, polymorphic: true
      t.timestamps
    end
  end
end
