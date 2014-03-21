class EventDecorator < Draper::Decorator
  delegate_all

  def submission_link
    return h.link_to "Submit a proposal!", h.proposals_path(object) if can_propose?
    h.content_tag :b, "Submission closed!"
  end

  def can_propose?
    active? and !expired?
  end

end
