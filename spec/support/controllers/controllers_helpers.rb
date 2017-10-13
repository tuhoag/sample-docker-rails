module ControllersHelpers
  def sign_in(user)
    session[:current_user_id] = user.id
  end
end