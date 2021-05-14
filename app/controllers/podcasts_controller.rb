class PodcastsController < ApplicationController
  def index
    query = params[:query]
    @query = query if query
    @podcasts = Podcast.search(query)
  end

end
