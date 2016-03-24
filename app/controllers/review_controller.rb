require_relative '../../lib/has_access'

class ReviewController < ApplicationController
  include HasAccess
  before_filter :authenticate!, :has_access?

  def list
    @event              = Event.where(slug: params[:event_slug]).first
    @proposals          = Proposal.for_event @event
    @sortable_questions = @event.questions.sortable
  end

  def detailed
    redirect_to list_path unless params[:proposal_id]

    @proposal = Proposal.includes(responses: :question).find(params[:proposal_id])
    @notes    = current_user.notes_for @proposal
    @event    = Event.where(slug: params[:event_slug]).first

    @blinds = Blind.visible_for(@event)
    @blinds.each do |blind|
      blind.existing_responses_for @proposal
    end
  end
end
