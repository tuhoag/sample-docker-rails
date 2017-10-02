require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
  	let(:user) { User.create(name: 'abc', email: 'abc@mail.vn', password: '123') }
  	let!(:saved_article) { Article.create(title: 'abc', user_id: user.id, body: 'abc') }
  	
  	subject(:article) { Article.new(title: 'abc', user_id: user.id, body: 'abc') }

    it "can create a valid article" do
      expect(Article.all.count).to eq(1)
    end

    it "should not have empty name" do
      subject.title = nil
      expect(subject).to be_invalid
    end

    it "should not have empty body" do
      subject.body = nil
      expect(subject).to be_invalid
    end
  end
end
