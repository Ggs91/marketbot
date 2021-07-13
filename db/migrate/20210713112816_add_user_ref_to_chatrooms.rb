class AddUserRefToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :user, index: true
    add_foreign_key :chatrooms, :users
  end
end
