class Event < ActiveRecord::Base
  has_many :blinds, -> { order("position ASC") }
  has_many :questions, through: :blinds
  has_many :proposals
  has_many :responses, through: :proposals

  scope :active, -> { where('active = ? AND ? <= expires', true, Time.now) }
  scope :expired, -> { where('? > expires', Time.now) }
  scope :inactive, -> { where(active: false) }

  def expired?
    return false if expires.nil?
    expires.past?
  end

  def is_a_human?(key)
    key === human_key
  end
end
