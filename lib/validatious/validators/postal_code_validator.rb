module Validatious
  module Validators
    
    # == Active Model Postal Code Validator
    class PostalCodeValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        countries = options[:country].is_a?(Array) ? options[:country] : [options[:country]]
        
        countries = countries.map do |name|
          country = case
            when name.is_a?(Symbol)
              record.send name
            when name.is_a?(Hash)
              c_obj = record.send(name.keys.first)
              c_obj ? c_obj.send(name[name.keys.first]) : nil
            else
              name.blank? ? 'USA' : name
          end

          regex = nil        
          Validatious::Addresses::Countries.countries.each do |config|
            if country =~ /^(#{config[:name]}|#{config[:alpha2]}|#{config[:alpha3]})$/i
              regex = config[:postal_code]
              break
            end
          end
          
          regex
        end.compact
        
        if countries.empty?
          record.errors.add :base, "A valid country must be provided for " +
                                   "#{attribute.to_s.humanize.downcase} validation."
        else
          valid = countries.map do |regex|
            !(value.to_s =~ /^#{regex}$/i).nil? ? true : nil
          end.compact
          
          record.errors.add attribute, :invalid_postal_code, options if valid.empty?
        end
      end
      
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::PostalCodeValidator = Validatious::Validators::PostalCodeValidator