class AddMessagesCountToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :messages_count, :integer, default: 0
  end
end
