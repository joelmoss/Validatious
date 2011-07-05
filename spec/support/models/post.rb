class Post
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attr_accessor :title, :url, :comment

  def initialize(attributes = {})
    attributes.each do |key, value|
      send "#{key}=", value
    end
  end

end
