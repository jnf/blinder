class UserCans

  def self.find_for user
    role_class = user.role.gsub(' ', '_').classify
    
    return UserCans.const_get(role_class) if UserCans.const_defined? role_class
    
  end


  class Default
    @@roles = {}
    include Can

  end

  class Admin
    @@roles = {}
    include Can

    can :control
    can :review

  end

  class Reviewer
    @@roles = {}
    include Can
    
    can :review

  end

end