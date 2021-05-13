class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.search(params[:query])
  end

end
