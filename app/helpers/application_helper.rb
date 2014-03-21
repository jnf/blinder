module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
    @markdown.render(content)
  end

  def proposal_list(event, proposals)
    proposals.map { |proposal|
      content_tag :li do
        link_to(proposal.slug[0,6], edit_control_event_proposal_path(event, proposal), class: 'slug') +
        " updated: #{ last_updated proposal }"
      end
    }.reduce &:+
  end
end
