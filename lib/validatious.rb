require 'active_model'
require 'active_support/dependencies/autoload'

require "validatious/version"

module Validatious
  module Validators
    extend ActiveSupport::Autoload
    
    autoload :UrlValidator
  end
end

require "validatious/helper_methods"

require 'active_support/i18n'
I18n.load_path << File.dirname(__FILE__) + '/validatious/locale/en.yml'