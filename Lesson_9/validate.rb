# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(arg_name, valid_type, *extra_args)
      send "#{valid_type}", arg_name, *extra_args
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue StandardError
      false
    end
  end
end
