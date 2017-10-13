class ChatRoomsController < ApplicationController
  before_action :authenticate

  def index
    @chat_rooms = current_user.chat_rooms
  end

  def new
  end

  def show
    begin
      @room = ChatRoom.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render_404
    end
  end

  def create
    begin
      room = ChatRoom.create!(chat_room_params)
      room.messages.create!(content: 'hi', user_id: current_user.id)
      redirect_to chat_room_path(room.id)
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "Cannot create chat room, please try again."
      render :index
    end
  end

  private
  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
