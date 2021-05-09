class WelcomeController < ApplicationController
  def index
    @podcast_count = Podcast.count
    @episode_count = Episode.count
  end
end
