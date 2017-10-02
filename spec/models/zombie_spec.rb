require 'rails_helper'

describe Zombie do 
	let(:zombie2) { Zombie.new }
	subject(:zombie) { Zombie.new }

	it { expect(zombie2.name).to eq 'Ash'}
	
	it "has no brain" do
		expect(subject.brains).to be < 1
	end

	it "is hungry" do
		zombie = Zombie.new

		expect(zombie.hungry?).to be true
	end
end