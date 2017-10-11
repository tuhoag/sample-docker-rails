require 'rails_helper'

RSpec.describe User, type: :model do
  describe "authentication helpers" do
    let (:valid_credential) { { email: 'hatu87@gmail.com', password: '123'} }
    let (:invalid_credentials) do
      [
        {
          email: 'hatu87@gmail.com',
          password: '1'
        },
        {
          email: 'hatu@gmail.com',
          password: '123'
        },
        {
          email: 'hatu@mail',
          password: '1'
        }
      ]
    end
    subject!(:user) { create(:user, valid_credential) }

    describe ".authenticate" do
      it "should return user with valid email/password" do
        result = User.authenticate(valid_credential)
        expect(result).to eq(user)
      end

      it "should return false with invalid email/password" do
        results = invalid_credentials.map { |credential| User.authenticate(credential)}
        expect(results).to eq([false, false, false])
      end
    end

    describe ".authenticate!" do
      it "should return user with valid email/password" do
        result = User.authenticate(valid_credential)
        expect(result).to eq(user)
      end

      it "should raise ActiveRecord::RecordNotFound with invalid email/password" do
        expect { invalid_credentials.each { |credential| User.authenticate!(credential)} }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe ".authenticate?" do
      it "should return true with valid email/password" do
        result = User.authenticate?(valid_credential)
        expect(result).to be true
      end

      it "should return false with invalid email/password" do
        results = invalid_credentials.map { |credential| User.authenticate?(credential)}
        expect(results).to eq([false, false, false])
      end
    end
  end
end
