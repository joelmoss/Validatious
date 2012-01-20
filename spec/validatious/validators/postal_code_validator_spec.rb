# encoding: utf-8

require "spec_helper"

describe Validatious::Validators::PostalCodeValidator do
  
  describe '12345' do
    it "should be valid" do
      Person.validates_postal_code_format_of(:postal_code, :country => ["US", 'CA'])
      p = Person.new :postal_code => 10001
      p.should be_valid
    end
  end
  
end