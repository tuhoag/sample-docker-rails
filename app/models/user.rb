class User < ApplicationRecord
  has_many :articles

	has_secure_password

	def self.authenticate!(session_params)
		user = User.authenticate(session_params)
		raise ActiveRecord::RecordNotFound unless user
		user
	end

  def self.authenticate(session_params)
  	user = User.find_by(email: session_params[:email])
  	(user && user.authenticate(session_params[:password])) || false
  end

	def self.authenticate?(session_params)
		result = User.authenticate(session_params)
		result != false
  end
end
