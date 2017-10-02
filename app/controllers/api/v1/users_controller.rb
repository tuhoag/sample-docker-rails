class Api::V1::UsersController < Api::V1::APIController
  def index
  	users = User.all 

  	render json: users
  end
end

