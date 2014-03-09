class User < ActiveRecord::Base

  USER_ROLES=[
    'admin',
    'reviewer',
    'default'
  ]

  # This should not be used because we do not allow open registration
  # Use check_from_omniauth below
  def self.register_from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.save!
    end
  end

  def self.check_from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first
    if user
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires
      user.save!
    end
    user
  end

  def role
    'default'
  end

end
