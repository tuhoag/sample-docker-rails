class AddChatRoomIdToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :chat_room_id, :integer
  end
end
