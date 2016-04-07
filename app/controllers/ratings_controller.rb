class RatingsController < ApplicationController
  include HasAccess
  before_filter :authenticate!
  before_filter :has_access?

  def rate
    rating = Rating.find_or_initialize_by ratings_params.merge(user_id: current_user.id)
    rating.score = params[:score]

    if rating.save
      flash[:notice] = "Proposal rating updated!"
      redirect_to list_path(params[:slug])
    else
      flash[:notice] = "Something went terribly wrong."
      redirect_to review_path(params[:slug], params[:proposal_id])
    end
  end

  private

  def ratings_params
    params.permit :proposal_id, :rating, :user_id
  end
end
