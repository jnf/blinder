module Can
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def can(sym, allow=true)
      roles[sym] = allow
    end

    def cannot(sym, allow=false)
      roles[sym] = allow
    end

    def can?(sym)
      roles[sym] || false
    end

    private

    def roles
      @roles ||= {}
    end
  end
end
