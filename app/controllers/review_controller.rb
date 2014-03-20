class ReviewController < ApplicationController
  include HasAccess
  before_filter :authenticate!
  before_filter :has_access?

  def list
    @event      = Event.find params[:event_id]
    @proposals  = Proposal.for_event @event
  end

  def detailed
    redirect_to list_path unless params[:proposal_id]
    @proposal = Proposal.includes(responses: :question).find(params[:proposal_id])
    @notes    = current_user.notes_for @proposal
    @event    = Event.find params[:event_id]
    
    @blinds = Blind.visible_for(@event)
    @blinds.each do |blind|
      blind.existing_responses_for @proposal
    end
  end
end
