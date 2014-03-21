module ReviewHelper
  def last_updated(proposal)
    proposal.updated_at.strftime("%r %D")
  end
end
