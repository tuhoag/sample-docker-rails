require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
	## validation tests
	it { should validate_presence_of(:title) }

	## association tests
  it { is_expected.to have_many(:messages) }
  it { is_expected.to have_many(:users) }
end
