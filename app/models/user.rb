class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password_digest, presence: true

  has_many :articles
  has_many :comments
  has_many :messages
  has_many :chat_rooms, through: :messages

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

	def self.online
		all
	end
end
