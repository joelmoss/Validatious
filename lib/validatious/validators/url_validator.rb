module Validatious
  module Validators
    
    # == Active Model Url Validator
    class UrlValidator < ActiveModel::EachValidator
      IPv4_PART = /\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]/  # 0-255
      REGEX = %r{
        \A
        https?://                                        # http:// or https://
        ([^\s:@]+:[^\s:@]*@)?                            # optional username:pw@
        ( (xn--)?[a-z0-9]+([-.][a-z0-9]+)*\.[a-z]{2,6}\.? |  # domain (including Punycode/IDN)...
            #{IPv4_PART}(\.#{IPv4_PART}){3} )            # or IPv4
        (:\d{1,5})?                                      # optional port
        ([/?]\S*)?                                       # optional /whatever or ?whatever
        \Z
      }iux
      
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :invalid_url, options) if value.to_s !~ REGEX
      end
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::UrlValidator = Validatious::Validators::UrlValidator