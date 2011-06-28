module ActiveModel
  module Validations
    module HelperMethods

      def validates_url_format_of(*attr_names)
        validates_with UrlValidator, _merge_attributes(attr_names)
      end
      
    end
  end
end