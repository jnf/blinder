class Question < ActiveRecord::Base
  belongs_to :blind
  has_many   :responses
end
