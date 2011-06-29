module Validatious
  module Validators
    
    # == Active Model Email Validator
    class EmailValidator < ActiveModel::EachValidator
      SPECIALCHARS = Regexp.escape('!#$%&\'*-/=?+-^_`{|}~')
      PARTUNQUOTED = '(([[:alnum:]' + SPECIALCHARS + ']+[\.\+]+))*[[:alnum:]' + SPECIALCHARS + '+]+'
      PARTQUOTED = '\"(([[:alnum:]' + SPECIALCHARS + '\.\+]*|(\\\\[\u0001-\uFFFF]))*)\"'
      REGEX = Regexp.new('^((' + PARTUNQUOTED + ')|(' + PARTQUOTED + ')+)@(((\w+\-+)|(\w+\.))*\w{1,63}\.[a-z]{2,6}$)', Regexp::EXTENDED | Regexp::IGNORECASE)
            
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :invalid_email, options) if value.to_s !~ REGEX
      end
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::EmailValidator = Validatious::Validators::EmailValidator