module ControlHelper
  def event_list(events)
    events.map { |event| content_tag :li, link_to(event.title, edit_event_path(event)) }.reduce &:+
    
    events.map do |event|
      content_tag :li, link_to( event.title, edit_event_path(event) ) + " #{event_state(event)}"
    end.reduce &:+
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
end
