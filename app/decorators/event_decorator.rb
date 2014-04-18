class EventDecorator < Draper::Decorator
  delegate_all

  def submission_link
    return h.link_to "Submit a proposal!", h.proposals_path(object) if can_propose?
    h.content_tag :b, "Submissions are closed!"
  end

  def can_propose?
    active? and !expired?
  end

  def view_link
    h.link_to 'View', h.event_path(object)
  end

  def proposals_link
    h.link_to 'Proposals', h.control_event_proposals_path(object)
  end

  def edit_link
    h.link_to 'Edit', h.edit_control_event_path(object)
  end

  def state_list
    "#{ 'active' if active? } #{ 'expired' if expired? }"
  end

  def time_sensitive_infos
    h.markdown(can_propose? ? info : inactive_info)
  end
end
