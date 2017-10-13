require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do
  include ControllersHelpers

  describe "GET index" do
    context "user is not logged in" do
      it "should redirect to login page" do
        get :index
        expect(response).to redirect_to(login_path)
      end
    end
    context "user is logged in" do
      it "should render all current user chat rooms" do
        user = create :user
        room = ChatRoom.create!(title: 'test1')
        create :chat_room
        room.messages.create!(content: 'test', user_id: user.id)

        sign_in(user)
        # session[:current_user_id] = user.id
        get :index
        expect(response).to render_template(:index)
        expect(response).to have_http_status(200)
        expect(assigns[:chat_rooms]).not_to be_nil
        expect(assigns[:chat_rooms].count).to eq(1)
        expect(assigns[:chat_rooms]).to eq([room])
        expect(ChatRoom.count).to eq(2)
      end
    end
  end
end
