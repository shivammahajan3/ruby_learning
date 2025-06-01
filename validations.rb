require 'byebug'
module CustomActiveRecord
  class Base
    $validates = {}

    def self.validate(attribute, option)
      # byebug
      $validates[attribute] ||= []
      $validates[attribute] << option
    end
      
    def valid?
      @errors = {}
      $validates.each do |attribute, rules|
        value = send(attribute)
        rules.each do |rule|
          check_presence(attribute, value) if rule[:presence]
          check_format(attribute, value, rule[:format]) if rule[:format]
          check_type(attribute, value, rule[:type]) if rule[:type]
          check_length(attribute, value, rule[:length]) if rule[:length]
        end
      end
      @errors.empty?
    end

    def validate!
      # byebug
      raise "ValidateError: #{error_messages}" unless valid?
    end

    def error_messages
      @errors.map { |attr, messages| "#{attr.to_s.capitalize} #{messages.join(', ')}" }.join(', ')
    end

    private

    def add_error(attribute, message)
      @errors[attribute] ||= []
      @errors[attribute] << message
    end

    def check_presence(attribute, value)
      add_error(attribute, "can't be blank") if value.nil? || (value.is_a?(String) && value.strip.empty?)
    end

    def check_format(attribute, value, regex)
      add_error(attribute, "is invalid as per regex") unless value =~ regex
    end

    def check_type(attribute, value, klass)
      add_error(attribute, "type #{klass} doesn't match") unless value.is_a?(klass)
    end

    def check_length(attribute, value, length_options)
      # byebug
      value = value.length if value.is_a?(String)
      if length_options[:in]
        min, max = length_options[:in].minmax
        if value < min || value > max
          add_error(attribute, "length must be between #{min} and #{max}")
        end
      end
      
      add_error(attribute, "length must be #{length_options[:is]}") if length_options[:is] && length_options[:is] != value
       
      add_error(attribute, "length must be greater than #{length_options[:minimum]}") if length_options[:minimum] && value < length_options[:minimum]

      add_error(attribute, "length must be less than #{length_options[:maximum]}") if length_options[:maximum] && value > length_options[:maximum]
        
    end
  end
end