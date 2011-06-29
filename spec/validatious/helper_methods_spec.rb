require "spec_helper"

describe Validatious, 'HelperMethods' do
  
  it 'should define class validation methods' do
    Post.should respond_to(:validates_url_format_of)
    Post.should respond_to(:validates_email_format_of)
  end
  
end