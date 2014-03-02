class Event < ActiveRecord::Base
  has_many :blinds, -> { order("position ASC") }
  has_many :questions, through: :blinds
  has_many :proposals
  has_many :responses, through: :proposals
end
