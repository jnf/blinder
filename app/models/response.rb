class Response < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :question

  def self.generate_collection_for(event, proposal)
    responses = []
    blinds = event.blinds
    blinds.each do |blind|
      group = []
      questions = blind.questions
      questions.each do |question|
        group.push Response.new(question: question, proposal: proposal)
      end
      responses.push group
    end

    responses
  end
end
