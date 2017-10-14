class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = ChatRoom.find(params[:roomId])
    stream_for room
  end

  def unsubscribed

  end

  def speak(data)
  	room_id = params[:roomId]
  	room = ChatRoom.find(room_id)
  	message = data['message']
  	current_user.messages.create!(content: message, chat_room_id: room_id)

  	RoomChannel.broadcast_to room, message: data['message'], user_name: current_user.name
  end
end
