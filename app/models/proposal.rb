require 'digest/sha1'

class Proposal < ActiveRecord::Base
  has_many   :responses, autosave: true
  belongs_to :event

  after_create :generate_slug

  scope :listing,   -> { select(:id, :slug, :created_at) }
  scope :for_event, -> (event_id) { listing.where(event_id: event_id).order(:created_at) }

  accepts_nested_attributes_for :responses

  def responses_for(blind)
    question_ids = blind.questions.map &:id
    responses.where(question_id: question_ids)
  end

  def get_email_address
    # I hate this method.
    # This exposes a fundamental weakness in my approach to this app. In the future,
    # this will need a refactor so that contact information is collected at the proposal level
    # rather than the blind level (or maybe through user accounts).
    q_id = event.questions.where(label: "Email Address").first.id
    responses.where(question_id: q_id).first.value
  end

  protected

  def generate_slug
    seed = self.responses.any? ? self.responses.sample.value : random_seed
    self.slug = Digest::SHA1.hexdigest(Time.now.to_s + seed)
    save!
  end

  def random_seed
    %w(taco _elephant werewolf submarine fern5 trampoline satellite fight! window).sample
  end
end
