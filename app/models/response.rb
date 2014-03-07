class Response < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :question

  validate :required_field?

  protected

  def required_field?
    if question.required? and value.blank?
      errors.add(:base, "'#{question.label}' is a required field.")
    end
  end
end
