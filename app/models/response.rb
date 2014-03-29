class Response < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :question
  has_one    :scrub
  
  before_save { |controller|  get_value_for_radio(self.value) unless (self.value.is_a? String) }

  validate :required_field?

  protected

  def get_value_for_radio(value_hash)
    self.value = value_hash.values.first.to_s
  end

  def required_field?
    if question.required? and value.blank?
      errors.add(:base, "<span>#{question.label}</span> is a required field.".html_safe )
    end
  end
end
