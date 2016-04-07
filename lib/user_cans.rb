class UserCans
  def self.find_for user
    role_class = user.role.gsub(' ', '_').classify
    return UserCans.const_get(role_class) if UserCans.const_defined? role_class
  end

  class Default
    include Can
  end

  class Admin
    include Can

    can :control
    can :"control::events"
    can :"control::proposals"
    can :review
    can :notes
    can :ratings
  end

  class Reviewer
    include Can

    can :review
    can :notes
    can :ratings
  end
end
