class Control::ProposalsController < ControlController
  def index
    @event  = Event.find params[:event_id]
    @unsafe = @event.proposals.unsafe
    @safe   = @event.proposals.safe
  end

  def edit

  end

  def update

  end
end
