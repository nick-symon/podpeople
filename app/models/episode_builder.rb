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
    # probably want a step here where we delete all non-favorited episodes before rebuilding
    @feed.items.each do | item |
      ep_hash = {}
      ep_hash[ "guid" ] = item.guid.content
      ep_hash[ "published_date" ] = item.pubDate
      ep_hash[ "link" ] = item.link
      ep_hash[ "description" ] = item.description
      ep_hash[ "duration" ] = item.itunes_duration&.content
      ep_hash[ "enclosure_type" ] = item.enclosure&.type
      ep_hash[ "enclosure_url" ] = item.enclosure&.url
      ep_hash[ "title" ] = item.title
      ep_hash[ "itunes_summary" ] = item.itunes_summary
      ep_hash[ "itunes_subtitle" ] = item.itunes_subtitle
      ep_hash[ "podcast_id" ] = @podcast_id
      Episode.find_or_create_by(ep_hash)
    end
  end
end