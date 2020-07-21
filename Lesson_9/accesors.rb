# frozen_string_literal: true

module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      name_history = "@#{name}_history".to_sym

      define_method(name) {instance_variable_get(var_name)}
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        if instance_variable_get(name_history).nil?
          instance_variable_set(name_history, [] << value)
        else
          instance_variable_get(name_history) << value
        end
      end

      define_method("#{name}_history") do
        instance_variable_get("@#{name}_history".to_sym)
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) {instance_variable_get(var_name)}
    define_method("#{attr_name}=".to_sym) do |value|
      raise "#{attr_name} is not a #{attr_name.class}" unless value.is_a? attr_class
      instance_variable_set(var_name, value)
    end
  end


end

class Test
  extend Accessors

  attr_accessor_with_history :a, :b
end
