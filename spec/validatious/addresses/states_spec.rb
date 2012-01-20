require 'spec_helper'

describe Validatious::Addresses::States do

  describe ".find_by_name" do
    it "should return proper results" do
      subject.find_by_name('Kansas')[:name].should == 'KANSAS'
      subject.find_by_name('Washington')[:name].should == 'WASHINGTON'
      subject.find_by_name('Arkansas')[:name].should == 'ARKANSAS'
    end
    
    it "should be case insensitive" do
      subject.find_by_name('KaNSaS')[:name].should == 'KANSAS'
      subject.find_by_name('ARKansAS')[:name].should == 'ARKANSAS'
      subject.find_by_name('texAs')[:name].should == 'TEXAS'
    end
  end
  
  describe ".find_by_abbr" do
    it "should return proper results" do
      subject.find_by_abbr('KS')[:name].should == 'KANSAS'
      subject.find_by_abbr('AR')[:name].should == 'ARKANSAS'
      subject.find_by_abbr('AK')[:name].should == 'ALASKA'
    end
  end

end