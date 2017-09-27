class UsersController < ApplicationController
  def new
  end

  def create
  	begin
  		user = User.create!(user_params)
  		flash[:success] = "Register successfully."
  		redirect_to login_path	
  	rescue ActiveRecord::RecordInvalid => e
  		flash[:error] = "Cannot register new account."
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
