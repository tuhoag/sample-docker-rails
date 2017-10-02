require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users" do
    it "works! (now write some real specs)" do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end

    it "should return all users" do
    	User.create(name: 'abc', email: 'abc@mail.vn', password: '123')
    	User.create(name: 'abc', email: 'abc@mail.vn', password: '123')

    	get '/api/v1/users'
    	#byebug
    	json = JSON.parse(response.body)

    	expect(response).to have_http_status(200)
    	expect(json["users"].length).to eq(2)
    end
  end
end
