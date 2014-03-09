class CollectController < ApplicationController
  def home
    @event = Event.first
  end

  def new
    @event = Event.includes(blinds: :questions).find(params[:event_id])
    @proposal = Proposal.new

    @event.blinds.each do |blind|
      blind.new_responses_for @proposal
    end
  end

  def create
    @proposal = Proposal.new(proposal_create_params)
    @proposal.responses.build(params[:responses])

    if @proposal.save
      redirect_to thanks_path @proposal.slug
    else
      @errors = @proposal.errors.messages
      @event = @proposal.event
      @event.blinds.each do |blind|
        blind.posted_responses_for @proposal
      end

      render action: :new
    end
  end

  def edit
    redirect_to root_path unless params[:slug]

    @proposal = Proposal.includes(responses: { question: :blind }).find_by_slug(params[:slug])
    @event = @proposal.event

    @event.blinds.each do |blind|
      blind.existing_responses_for @proposal
    end

    render action: :new
  end

  def update
    params[:responses].each do |response|
      Response.find(response['id']).update(response)
    end
    @proposal = Proposal.includes(:responses).find(params[:id])

    render action: :create
  end

  def thanks
    @proposal = Proposal.includes(event: { blinds: :questions }).find_by_slug params[:slug]
    @blinds = @proposal.event.blinds
  end

  protected

  def proposal_create_params
    params.permit(:event_id, :slug, :responses)
  end
end
  