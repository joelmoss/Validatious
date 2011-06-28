require 'active_support'

require 'active_model'
require 'active_model/validations'
require 'active_model/validator'

require "validatious/version"

module Validatious
  module Validators
    extend ActiveSupport::Autoload
    
    autoload :UrlValidator
  end
end

require "validatious/helper_methods"