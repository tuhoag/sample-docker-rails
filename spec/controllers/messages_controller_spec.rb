require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  include ControllersHelpers
  describe "POST create" do
    context "user is not logged in" do
      it "should not create a message and redirect login page" do
        room = create :chat_room

        post :create, params: { chat_room_id: room.id }
        expect(response).to redirect_to(login_path)
      end
    end
    context "user is logged in" do
      let!(:user) { create :user }
      let!(:room) { create :chat_room }

      before do
        user.messages.create!(content: 'temp', chat_room_id: room.id)
        sign_in(user)
        expect(user.messages.count).to eq(1)
      end

      it "should create a new message and redirect show chat room" do
        post :create, params: { chat_room_id: room.id, message: { content: 'test' }}

        expect(response).to redirect_to(chat_room_path(room.id))
        expect(user.messages.count).to eq(2)
        expect(user.messages.last.content).to eq('test')
        expect(user.messages.last.user_id).to eq(user.id)
        expect(user.messages.last.chat_room_id).to eq(room.id)
      end

      it "should return a flash error message if cannot create message" do
        post :create, params: { chat_room_id: room.id, message: { content: '' }}

        expect(response).to redirect_to(chat_room_path(room.id))
        expect(user.messages.count).to eq(1)
        expect(flash[:error]).to eq("Cannot send message")
      end
    end
  end
end
