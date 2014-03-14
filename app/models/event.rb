class Event < ActiveRecord::Base
  has_many :blinds, -> { order("position ASC") }
  has_many :questions, through: :blinds
  has_many :proposals
  has_many :responses, through: :proposals

  def is_a_human?(key)
    key === human_key
  end
end
