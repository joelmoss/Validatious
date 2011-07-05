require "validatious/version"

module Validatious
  module Validators
    # nothing to see here, move along...
  end
end

require "validatious/validators/url_validator"
require "validatious/validators/email_validator"
require "validatious/validators/text_content_validator"
require "validatious/helper_methods"

require 'active_support/i18n'
I18n.load_path << File.dirname(__FILE__) + '/validatious/locale/en.yml'