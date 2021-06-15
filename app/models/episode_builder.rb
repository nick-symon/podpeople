require 'rss'
require 'open-uri'

module EpisodeBuilder
  def self.build_episode(rss, podcast_id)
    episode_arr = []
    link = URI.open(rss)
    feed = RSS::Parser.parse(rss, do_validate=false)
    feed.items.each do | item |
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
      ep_hash[ "podcast_id" ] = podcast_id
      e = Episode.find_or_initialize_by(ep_hash)
      episode_arr << e
    end
    episode_arr
  end
end