# encoding: utf-8

require "spec_helper"

describe Validatious::Validators::EmailValidator do
  
  before(:each) do
    Topic.validates_email_format_of(:email)
  end
  
  let(:topic) { post = Topic.new(:title => "The title", :email => "invalid email") }
  
  [
    'bob@bones.com',
    'bob.bones@bones.com'
  ].each do |email|
    describe email.inspect do
      it "should be valid" do
        topic.email = email
        topic.should be_valid
      end
    end
  end
  
  [nil, 1, "", " ", "email"].each do |email|
    describe email.inspect do
      it "should not be valid" do
        topic.email = email
        topic.should_not be_valid
      end
    end
  end
  
end