class User < ActiveRecord::Base
  has_many :notes

  USER_ROLES=[
    'admin',
    'reviewer',
    'default'
  ]

  def notes_for(proposal)
    note = notes.where(proposal: proposal).first
    note || Note.new
  end

  def can?(do_something)
    cans.can? do_something
  end

  # This should not be used because we do not allow open registration
  # Use check_from_omniauth below
  def self.register_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.save!
    end
  end

  def self.check_from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first
    if user
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.save!
    end
    user
  end

  protected
  
  def cans
    UserCans.find_for self
  end
end
