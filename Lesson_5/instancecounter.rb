module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instances_score

    def instancecounter
      instances_score || 0
    end
  end

  module InstanceMethods
    
    protected

    def register_instance
      self.class.instances_score ||= 0
      self.class.instances_score += 1
    end
  end
end
