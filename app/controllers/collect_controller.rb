require 'postmark'

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
      send_confirmation_email
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
    @proposal = Proposal.includes(:responses).find(params[:id])
    @proposal.responses.each do |response|
      selected = params[:responses].find { |param| param[:id] == response.id.to_s }
      response.update(selected) if selected
    end

    if @proposal.save
      send_confirmation_email
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

  def thanks
    @proposal = Proposal.includes(event: { blinds: :questions }).find_by_slug params[:slug]
  end

  protected

  def proposal_create_params
    params.permit(:event_id, :slug, :responses)
  end

  def send_confirmation_email
    mailer = Postmark::ApiClient.new ENV['POSTMARK_API_KEY']
    mailer.deliver from:      'cfp@steelcityruby.org',
                   to:        @proposal.get_email_address,
                   bcc:       'cfp@steelcityruby.org',
                   subject:   "Thank you for submitting to #{ @proposal.event.title }!",
                   tag:       'cfp-thanks',
                   html_body: render_to_string(layout: false, template: "collect/thanks")
  end
end
  