module ReviewHelper
  def last_updated(proposal)
    proposal.updated_at.strftime("%r %D")
  end

  def notes_for(proposal)
    notes = proposal.notes_for_user(current_user)
    if notes then "(#{ notes.content.truncate(50) })" else '' end
  end
end
