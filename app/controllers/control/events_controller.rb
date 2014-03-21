class Control::EventsController < ControlController
  def index
    @events = Event.order(:title)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    clear_event_date :expires if params[:event][:expirable] == '0'
    event.update_attributes(event_update_params[:event])
    redirect_to action: :index
  end

  protected

  def event_update_params
    params.permit(event: [:title, :info, :blind_level])
  end

  def clear_event_date key
    params[:event].delete "#{key}(1i)"
    params[:event].delete "#{key}(2i)"
    params[:event].delete "#{key}(3i)"
    params[:event][:expires] = nil
  end
end
