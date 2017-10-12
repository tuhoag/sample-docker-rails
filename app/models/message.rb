class Message < ApplicationRecord
	belongs_to :chat_room
	belongs_to :user

	validates :content, presence: true
end
