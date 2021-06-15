class EpisodesController < ApplicationController
  def index
    # get the podcast id from params
    # get count of episodes, compare to rss feed count
    # if they are equal, just load the episodes (jump to finish)
    # otherwise, run the podcsat update helper
    # then load podcasts
    @podcast = Podcast.find(params[:id])
    ep_builder = EpisodeBuilder.new(@podcast.rss_feed_link, @podcast.id)
    if ep_builder.build_episodes?
      ep_builder.build_episodes
    end
    @episodes = @podcast.episodes
    # return js.erb file where we insert the episode partials
  end
end
