module ControlHelper
  def event_list(events)
    events.map { |event| 
      content_tag :li, event_title(event) + ' ' + event_edit_link(event) + ' ' + proposals_link(event) + " #{event_state(event)}" 
    }.reduce &:+
  end

  def event_title(event)
    content_tag :strong, event.title
  end

  def event_edit_link(event)
    link_to 'Edit', edit_control_event_path(event)
  end

  def proposals_link(event)
    link_to 'Proposals', control_event_proposals_path(event)
  end

  def active_text event
    'active' if event.active?
  end

  def expired_text event
    'expired' if event.expired?
  end

  def event_state event
    states = [active_text(event), expired_text(event)].compact
    states.join ' '
end
