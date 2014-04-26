class ResponseDecorator < Draper::Decorator
  delegate_all

  def current_blind_level
    object.proposal.event.blind_level
  end

  def value_without_scrub_markers
    scrub.blank? ? h.markdown(value) : h.markdown(scrub.value)
  end

  def scrubbed_value
    scrub.blank? ? '' : scrub_marker << scrub.value
  end

  def original_value
    object.scrubbed_at?(current_blind_level) ? '' : h.markdown( original_marker + value )
  end

  def scrub_marker
    h.content_tag :h6, "This response is scrubbed until blind level #{ scrub.blind_level }."
  end

  def original_marker
    if scrub.blank?
      ''
    else
      h.content_tag :h6, "This is the original response to the question:"
    end
  end
end
