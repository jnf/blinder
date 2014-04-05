class Control::ProposalsController < ControlController
  def index
    @event  = Event.find params[:event_id]
    @unsafe = @event.proposals.unsafe
    @safe   = @event.proposals.safe
  end

  def edit
    @proposal = Proposal.includes(responses: :scrub, event: :questions).find params[:id]
    @notes    = current_user.notes_for @proposal
    @proposal.event.blinds.each do |blind|
      blind.existing_responses_for @proposal
    end
  end

  def update
    @proposal = Proposal.find params[:id]
    @proposal.safe_for_review = params[:proposal][:safe_for_review]

    if @proposal.save
      flash[:notice] = "Proposal updated!"
      redirect_to action: :index
    else
      flash[:notice] = "Something went terribly wrong."
      redirect_to action: :edit
    end
  end

  def destroy
    Proposal.find(params[:id]).destroy
    redirect_to :back, notice: "Proposal destroyed!"
  end

  def scrub
    scrub = Scrub.find_or_create_by(response_id: scrub_ajax_params[:scrub][:response_id])
    scrub.update scrub_ajax_params[:scrub]
    render partial: 'review/response', locals: { response: scrub.response.decorate }
  end

  protected

  def scrub_ajax_params
    params.permit(scrub: [:response_id, :blind_level, :value])
  end

end
