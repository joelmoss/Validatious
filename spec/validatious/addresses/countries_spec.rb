require 'spec_helper'

describe Validatious::Addresses::Countries do

  describe ".find_by_name" do
    it "should return proper country" do
      subject.find_by_name('United States')[:name].should == 'United States'
      subject.find_by_name('France')[:numeric].should == "249"
    end

    it "should be case insensitive" do
      subject.find_by_name('CzEcH REPublIC')[:alpha3].should == 'CZE'
      subject.find_by_name('SLOvakia')[:alpha2].should == 'SK'
    end
  end

  describe ".find_by_alpha2" do
    it { subject.find_by_alpha2('US')[:alpha3].should == 'USA' }
  end

  describe ".find_by_alpha3" do
    it { subject.find_by_alpha3('USA')[:alpha2].should == 'US' }
  end

  describe "the regular old find method with multiple field search" do
    it { subject.find('United States', [:name, :alpha2, :alpha3])[:alpha2].should == 'US' }
    it { subject.find('AU', [:name, :alpha2, :alpha3])[:alpha2].should == 'AU' }
    it { subject.find('249', [:iso_code, :name])[:name].should == 'France' }
  end

  describe "find_by methods return same object" do
    it { subject.find_by_alpha2('US').should == subject.find_by_alpha3('USA') }
    it { subject.find_by_name('United States').should == subject.find_by_abbr('US') }
    it { subject.find_by_abbr('USA').should == subject.find_by_iso_code('840') }
  end

  describe ".where_is_zip_valid" do
    it { subject.where_is_zip_valid('123KKK9093450').length.should == 191 }
    it { subject.where_is_zip_valid('67013').should include(subject.find_by_abbr('USA')) }
  end

  describe ".eu?" do
    it { subject.eu?('France').should be_true }
    it { subject.eu?('Czech Republic').should be_true }
    it { subject.eu?(subject.find_by_name('United Kingdom')).should be_true }
    it { subject.eu?('United States').should be_false }
    it { subject.eu?(subject.find_by_name('Canada')).should be_false }
  end

  describe ".north_america?" do
    it { subject.north_america?('Canada').should be_true }
    it { subject.north_america?('United States').should be_true }
    it { subject.north_america?(subject.find_by_name('United States')).should be_true }
    it { subject.north_america?('United Kingdom').should be_false }
    it { subject.north_america?(subject.find_by_name('France')).should be_false }
  end

  describe ".find_by_abbr" do
    it { subject.find_by_abbr('USA')[:alpha3].should == 'USA' }
    it { subject.find_by_abbr('US')[:alpha2].should == 'US' }
    it { subject.find_by_abbr('ESP')[:alpha3].should == 'ESP' }
    it { subject.find_by_abbr('ES')[:alpha2].should == 'ES' }
  end

  describe "regional shortcuts" do
    it { subject.north_america.length.should == 3 }
    it { subject.eu.length.should == 27 }
  end

  describe ".find_all_by_region" do
    it { subject.find_all_by_region('North America').length.should == 3 }
    it { subject.find_all_by_region('EU').length.should == 27 }
    it { subject.find_all_by_region('Northern Hemisphere').length.should == 40 }
    it { subject.find_all_by_region('Western Hemisphere').length.should == 8 }
  end

end