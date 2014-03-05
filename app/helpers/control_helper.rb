module ControlHelper
  def event_list(events)
    events.map { |event| content_tag :li, link_to(event.title, edit_event_path(event)) }.reduce &:+
  end
end
