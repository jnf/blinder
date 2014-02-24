class Proposal < ActiveRecord::Base
  has_many   :responses
  belongs_to :event

  after_create :generate_code

  accepts_nested_attributes_for :responses
end
