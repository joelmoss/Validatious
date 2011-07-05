module Validatious
  module Validators
    
    # == Active Model Text Content Validator
    class TextContentValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        return if value.nil?
        
        error = false
        
        # The text should start with a capital letter
        error = true if value.match(/[A-Z]/).nil?
        
        # The text should contain at least one punctuation mark
        error = true if value.match(/[\.?!]/).nil?
        
        # There should be at least one 'e' per 30 characters
        error = true if value.downcase.count('e') < (value.downcase.gsub(/[^a-z]*/, '').length / 30)
        
        # There should be at least one space per 20 characters
        error = true if value.downcase.count(' ') < (value.length / 20)
        
        # The text should be at least 25% lowercase
        error = true if value.gsub(/[^a-z]*/, '').length < (value.downcase.gsub(/[^a-z]*/, '').length / 4)
        
        record.errors.add(attribute, :invalid_text_content, options) if error
      end
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::TextContentValidator = Validatious::Validators::TextContentValidator