class Control::EventsController < ControlController
  def index
    @events = Event.order(:title)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes(event_update_params[:event])
    redirect_to action: :index
  end

  def proposals
    @event = Event.find(params[:id])
    # unsafe = @event.proposals.unsafe
    # safe = @event.proposals.safe
  end

  protected

  def event_update_params
    params.permit(event: [:title, :info, :blind_level])
  end
end
