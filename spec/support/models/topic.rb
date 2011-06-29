class Topic
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :title, :email

  def initialize(attributes = {})
    attributes.each do |key, value|
      send "#{key}=", value
    end
  end

end
