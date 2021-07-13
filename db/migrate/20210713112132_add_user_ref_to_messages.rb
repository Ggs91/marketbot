class AddUserRefToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :user, index: true
    add_foreign_key :messages, :users
  end
end
