module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      p "There are(is) #{self.class_variable_get(self.class_variables[0]).count} instances in the class #{self}"
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances
    end
  end
end
