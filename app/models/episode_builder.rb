require 'rss'
require 'open-uri'

class EpisodeBuilder
  attr_accessor :rss, :podcast_id

  def initialize(rss_link, podcast_id)
    @link = URI.open(rss_link)
    @feed = RSS::Parser.parse(@link, do_validate=false) 
    @podcast_id = podcast_id
  end

  def count
    @feed.items.count
  end

  def build_episodes?
    Podcast.find(@podcast_id).episodes.count != self.count
  end

  def build_episodes
    @feed.items.each do | item |
      Episode.find_or_create_by(guid: item.guid.content) do |e|
        e.guid = item.guid.content
        e.published_date = item.pubDate
        e.link = item.link
        e.description = item.description
        e.duration = item.itunes_duration&.content
        e.enclosure_type = item.enclosure&.type
        e.enclosure_url = item.enclosure.url
        e.title = item.title
        e.itunes_summary = item.itunes_summary
        e.itunes_subtitle = item.itunes_subtitle
        e.itunes_season = item.itunes_season
        e.itunes_episode = item.itunes_episode
        e.podcast_id = @podcast_id
      end
    end
  end
end