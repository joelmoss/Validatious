module ActiveModel
  module Validations
    module HelperMethods

      def validates_url_format_of(*attr_names)
        validates_with UrlValidator, _merge_attributes(attr_names)
      end
      
      def validates_email_format_of(*attr_names)
        validates_with EmailValidator, _merge_attributes(attr_names)
      end
      
      def validates_postal_code_format_of(*attr_names)
        validates_with PostalCodeValidator, _merge_attributes(attr_names)
      end
      
      def validates_text_content_of(*attr_names)
        validates_with TextContentValidator, _merge_attributes(attr_names)
      end
      
    end
  end
end