require 'postmark'

class CollectController < ApplicationController

  before_filter  :reject_robots,   only: [:create, :update]
  ROBOT_ERROR = "There was a problem validating your <span>human key</span>. Please try again.".html_safe

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
    @proposal.responses.build(params[:responses])

    if @is_a_human && @proposal.save
      send_confirmation_email
      redirect_to thanks_path @proposal.slug
    else
      add_errors
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
    @proposal.responses.each do |response|
      selected = params[:responses].find { |param| param[:id] == response.id.to_s }
      response.update(selected) if selected
    end

    if @is_a_human && @proposal.save
      send_confirmation_email
      redirect_to thanks_path @proposal.slug
    else
      add_errors
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

  def reject_robots
    if params[:event_id] #create action
      @proposal = Proposal.new(proposal_create_params)
      @event = Event.find(params[:event_id])
    else #update action
      @proposal = Proposal.includes(:event, :responses).find(params[:id])
      @event = @proposal.event
    end

    @is_a_human = params[:human_key] === @event.human_key
  end

  def add_errors
    @errors = @proposal.valid? ? { :"responses.base" => [] } : @proposal.errors.messages
    @errors[:"responses.base"].push(ROBOT_ERROR) unless @is_a_human
  end

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
  