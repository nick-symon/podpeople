class PodcastsController < ApplicationController
  def index
    query = params[:query]
    @query = query if query
    @pagy, @podcasts = pagy Podcast.search(query)

    respond_to do |format|
      format.html
      format.js
      format.json {
        render json: {html: render_to_string(partial: 'podcast-list', locals: {podcasts: @podcasts}, formats: [:html])}
      }
    end

  end

  def show 
    # update and eager load addt'l associations on pcast
    @podcast = Podcast.includes(:episodes, :reviews).find(params[:id])
    # add addt'l instance variables for addt'l associations
    @episode_pagy, @episodes = pagy(@podcast.episodes, page_param: :page_episodes)
    @review_pagy, @reviews = pagy(@podcast.reviews, page_param: :page_reviews)
    
    if user_signed_in?
      @profile = current_user.profile
      @review = Review.where(profile: @profile, podcast: @podcast)
    end

    respond_to do |format|
      format.html
      format.js
      format.json {
        render json: {html: render_to_string(partial: 'episodes/episode-list', locals: {episodes: @episodes}, formats: [:html])}
      }
    end

  end

end
