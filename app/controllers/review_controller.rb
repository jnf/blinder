class ReviewController < ApplicationController
  def list
    @event      = Event.find params[:event_id]
    @proposals  = Proposal.for_event @event
  end

  def detailed
    redirect_to list_path unless params[:proposal_id]
    @proposal = Proposal.includes(responses: :question).find(params[:proposal_id])
    @event    = Event.find params[:event_id]
    
    @event.blinds.each do |blind|
      blind.existing_responses_for @proposal
    end
  end
end
