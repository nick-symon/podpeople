class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @profile = current_user.profile
    end
    @podcast_count = Podcast.count
    @episode_count = Episode.count
  end
end
