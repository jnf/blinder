class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal

  scope :for_proposal, -> (proposal) { where(proposal: proposal) }
end
