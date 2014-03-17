module ControlHelper
  def event_list(events)
    events.map { |event| 
      content_tag :li, event_title(event) + ' ' + event_edit_link(event) + ' ' + proposals_link(event) 
    }.reduce &:+
  end

  def event_title(event)
    content_tag :strong, event.title
  end

  def event_edit_link(event)
    link_to 'Edit', edit_control_event_path(event)
  end

  def proposals_link(event)
    link_to 'Proposals', proposals_control_event_path(event)
  end
end
