class Blind < ActiveRecord::Base
  belongs_to    :event
  acts_as_list  scope: :event
  has_many      :questions, -> { order("position DESC") }

  attr_accessor :responses

  def new_responses_for(proposal)
    @responses = questions.map { |question| Response.new question: question, proposal: proposal }
  end
end
