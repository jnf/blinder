class Question < ActiveRecord::Base
  belongs_to    :blind
  acts_as_list  scope: :blind
  has_many      :responses
end
