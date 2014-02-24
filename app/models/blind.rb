class Blind < ActiveRecord::Base
  belongs_to  :event
  has_many    :questions
end
