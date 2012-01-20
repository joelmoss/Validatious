class Person
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :postal_code

  def initialize(attributes = {})
    attributes.each do |key, value|
      send "#{key}=", value
    end
  end

end
