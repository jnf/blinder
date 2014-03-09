module HasAccess

  def self.included(base)
    base.class_eval do
      before_filter :has_access?
    end
  end

  def has_access?
    class_name = self.class.to_s.downcase.gsub('controller','')
    cans = UserCans::Default
    cans = UserCans.find_for current_user unless current_user.nil?
    allow = cans.can? class_name.to_sym

    if !allow
      flash[:notice] = "You are not authorized to access #{class_name.capitalize}"
      redirect_to root_path
    end
  end

end