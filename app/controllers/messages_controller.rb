class MessagesController < ApplicationController
  before_action :authenticate, only: [:create]

  def create
    begin
      room = ChatRoom.find(params[:chat_room_id])

      params_hash = message_params
      params_hash[:user_id] = current_user.id
      room.messages.create!(params_hash)

      redirect_to chat_room_path(room.id)
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "Cannot send message"
      redirect_to chat_room_path(room.id)
    rescue ActiveRecord::RecordNotFound => e
      render_404
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
