require 'rails_helper'

RSpec.describe Message, type: :model do
	## validation tests
  it { should validate_presence_of(:content) }

	## associations
	it { should belong_to(:chat_room) }
	it { should belong_to(:user) }
end
