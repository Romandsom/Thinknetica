# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, validation, *args)
      send "#{validation}_for", name, *args
    end

    protected

    def presence_for(name)
      validation_name = "#{name}_is_present?"
      define_method(validation_name) do
        var_name = "@#{name}".to_sym
        value = instance_variable_get(var_name)
        raise "#{name.capitalize} field can't be blank/empty!" if value.nil? || value == ''

        return true
      end
    end

    def format_for(name, args)
      validation_name = "#{name}_is_type?"
      define_method(validation_name) do
        var_name = "@#{name}".to_sym
        value = instance_variable_get(var_name)
        raise 'Number has invalid format. ***-** or ***** expected' if value !~ args

        return true
      end
    end

    def type_for(name, args)
      validation_name = "#{name}_is_type?"
      define_method(validation_name) do
        var_name = "@#{name}".to_sym
        value = instance_variable_get(var_name)
        raise "#{name.capitalize} is not a #{args}, it is #{value.class}" unless value.is_a? args

        return true
      end
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      methods = public_methods.select { |name| name.to_s =~ /.*_is_(present|format|type)\?$/ }
      methods.each { |method| send method }
      'All variables are valid'
    rescue StandardError => e
      raise e.message
    end
  end
end
