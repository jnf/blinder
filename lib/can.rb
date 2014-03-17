module Can
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def can(sym=nil, allow=true)
      return allows if sym.nil?
      roles = self.allows
      roles[sym] = allow
      allows= self.allows.merge(roles)
    end

    def cannot(sym=nil, allow=false)
      return allows if sym.nil?
      roles = self.allows
      roles[sym] = allow
      allows= self.allows.merge(roles)
    end

    def can?(sym)
      class_variable_get(:@@roles)[sym] || false
    end

    def roles
      class_variable_get(:@@roles)
    end

    protected

    def allows
      r = class_variable_get(:@@roles)
      if r.nil?
        class_variable_set :@@roles, {}
      end
      class_variable_get(:@@roles)
    end

    def allows=(hash)
      class_varaible_set :@@roles , hash
    end
  end
end
