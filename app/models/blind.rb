class Blind < ActiveRecord::Base
  belongs_to   :event
  acts_as_list scope: :event
  has_many     :questions, -> { order("position ASC") }
end
