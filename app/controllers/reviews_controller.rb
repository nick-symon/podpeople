class ReviewsController < ApplicationController
  def new
    if user_signed_in?
      @profile = current_user.profile
      @podcast = Podcast.find(params[:podcast_id])
      @review = Review.new(podcast: @podcast, profile: @profile)
    else
      redirect_to root, message: "You must be signed in!"
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end


  private
  def review_params
    params.require(:review).permit(:profile_id, :podcast_id, :content, :rating)
  end
end

