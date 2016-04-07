module ReviewHelper
  def last_updated(proposal)
    proposal.updated_at.strftime("%r %D")
  end

  def notes_for(proposal)
    notes = proposal.notes_for_user(current_user)
    if notes then "(#{ notes.content.truncate(50) })" else '' end
  end

  def scrub_vars_for(response)
    {
      scrub:       response.scrub || Scrub.new, #I'm so damn lazy.
      response_id: response.id,
      passed_blind_level: response.question.blind.level + 1
    }
  end

  def score_class(proposal,score)
    proposal.user_score(current_user) == score ? "selected" : ""
  end
end
