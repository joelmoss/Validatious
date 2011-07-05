# encoding: utf-8
require "spec_helper"

describe Validatious::Validators::TextContentValidator do
  
  before(:each) do
    Post.validates_text_content_of(:comment)
  end
  
  let(:post) { Post.new }
    
  [
    "",
    'this comment has absolutely no capitalization.',
    'This comment has no type of punctuation',
    "Fdkjd dk dkkjhd kjdhkjd kjdhdhdl alkasla lka alk.",
    "THIS COMMENT IS ALL IN UPPERCASE. ME NO WANT.",
    "Thiscommenthasabsolutelynospacesthereisnowaythisisgood.",
    "THIS COMMENT is MORE THAN 80% CAPITALS.",
    "THIS pERSON hAS tHEIR cAPS-lOCK oN."
  ].each do |text|
    describe text.inspect do
      it "should be invalid" do
        post.comment = text
        post.should_not be_valid
      end
    end
  end
  
  [
    'This is a very simple test comment.',
    'Supercalifragilisticexpialadocious: a super long word!',
    'How many words can I think of that don\'t contain an "e"?',
    'WHAT?! You mean to tell *ME* that SONY/ERICSSON *CAN\'T* make a phone?',
    'WHAT?! YOU MEAN TO TELL ME that SONY/ERICSSON *CAN\'T* make a phone?',
    'ROFL! Who do I have to shag to get a comment around here?',
    'I\'m a Klingon. It\'s kind of my thing to be angry for almost no good reason. Yesterday I tore the door off my fridge cause I was out of margarine. These things happen.'
  ].each do |text|
    describe text.inspect do
      it "should be valid" do
        post.comment = text
        post.should be_valid
      end
    end
  end
  
end