class Response < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :question
end
