class ControlController < ApplicationController
  include HasAccess
  before_filter :authenticate!
  before_filter :has_access?

  def proposal_list_for_event
    @event = Event.find(params[:id])
    unsafe = @event.proposals.unsafe
    safe = @event.proposals.safe
  end
end
