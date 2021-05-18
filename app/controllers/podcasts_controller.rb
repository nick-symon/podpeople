class PodcastsController < ApplicationController
  def index
    query = params[:query]
    @query = query if query
    @pagy, @podcasts = pagy Podcast.search(query)

    respond_to do |format|
      format.html
      format.js
      format.json {
        render json: {html: render_to_string(partial: 'podcast-list', formats: [:html])}
      }
    end
  end

  def show 
    # update and eager load addt'l associations on pcast
    @podcast = Podcast.includes(:episodes).find(params[:id])
    # add addt'l instance variables for addt'l associations
    @episodes = @podcast.episodes
    
  end

end
