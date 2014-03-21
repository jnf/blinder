class Event < ActiveRecord::Base
  has_many :blinds, -> { order("position ASC") }
  has_many :questions, through: :blinds
  has_many :proposals
  has_many :responses, through: :proposals

  scope :active, -> { where('active = ? AND ? <= expires_at', true, Time.now) }
  scope :expired, -> { where('? > expires_at', Time.now) }
  scope :inactive, -> { where(active: false) }

  def expired?
    return false if expires_at.nil?
    expires_at.past?
  end

  def is_a_human?(key)
    key === human_key
  end
end
