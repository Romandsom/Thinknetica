module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validates

    def validate(name, type, *args)
      self.validates ||= []
      self.validates << { name: name, type: type, options: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        name = instance_variable_get("@#{validation[:name]}")
        send("valid_#{validation[:type]}", name, *validation[:options])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def valid_presence(name)
      raise "#{name.capitalize} field can't be blank/empty!" if name.nil? || name == ''

      return true
    end

    def valid_format(name, args)
      raise 'Number has invalid format. ***-** or ***** expected' if name !~ args

      return true
    end

    def valid_type(name, args)
      raise "#{name.capitalize} is not a #{args}, it is #{name.class}" unless name.is_a? args

      return true
    end
  end
end
