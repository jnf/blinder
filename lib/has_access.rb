module HasAccess

  def self.included(base)
    base.class_eval do
      before_filter :has_access?
    end
  end

  def has_access?
    redirect_to root_path and return if current_user.nil?
    class_name = self.class.to_s.downcase
    cans = UserCans.find_for current_user
    allow = cans.can? class_name.to_sym

    redirect_to root_path unless allow
  end

end