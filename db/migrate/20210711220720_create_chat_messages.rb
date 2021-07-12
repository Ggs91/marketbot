class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :sendable, polymorphic: true
      t.belongs_to :chat_room, index: true
      t.timestamps
    end
  end
end
