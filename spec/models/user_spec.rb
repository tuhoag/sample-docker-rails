require 'rails_helper'

RSpec.describe User, type: :model do
	subject { User.new(name: 'hatu', email: 'hatu@mail.vn', password: '123') }

	it "is valid with valid attributes" do
		expect(subject).to be_valid		
	end

	it "is invalid with empty name" do
		subject.name = ""

		expect(subject).to be_invalid
	end 

	it "is invalid with empty email" do
		subject.email = ""

		expect(subject).to be_invalid	
	end

	it "is invalid with empty password" do 
		subject.password_digest = ""
		expect(subject).to be_invalid
	end
end
