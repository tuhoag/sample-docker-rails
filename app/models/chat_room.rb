class ChatRoom < ApplicationRecord
	has_many :messages
	has_many :users, through: :messages

	validates :title, presence: true
end
