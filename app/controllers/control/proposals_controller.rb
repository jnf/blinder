class Control::ProposalsController < ControlController
  def index
    @event  = Event.find params[:event_id]
    @unsafe = @event.proposals.unsafe
    @safe   = @event.proposals.safe
  end

  def edit
    @proposal = Proposal.includes(:responses, event: :questions).find params[:proposal_id]
    @proposal.event.blinds.each do |blind|
      blind.existing_responses_for @proposal
    end
  end

  def update
    @proposal = Proposal.find params[:proposal_id]
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
    Proposal.find(params[:proposal_id]).destroy
    redirect_to :back, notice: "Proposal destroyed!"
  end
end
