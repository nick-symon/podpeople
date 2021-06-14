require 'rss'
require 'kimurai'
require 'open-uri'

class PodcastSpider < Kimurai::Base
  @engine = :mechanize
  @start_urls = ["https://podcasts.apple.com/us/genre/podcasts/id26"]
  @config = {
    skip_request_errors: [{ error: RuntimeError, message: "#<OpenURI::HTTPError: 404 Not Found>" }],
    retry_request_errors: [{ error: OpenURI::HTTPError, skip_on_failure: true }],
    before_request: {
      # Change user agent before each request:
      # change_user_agent: true,
      # Change proxy before each request:
      # change_proxy: true,
      # Clear all cookies and set default cookies (if provided) before each request:
      clear_and_set_cookies: true,
      # Process delay before each request:
      # delay: 1..5
    }
  }
  
  def self.open_spider
    @@podcast_ids = Podcast.pluck(:id)
    @@podcasts_added = []
    @@total_pods = 0
    @@podcasts_rejected = 0
    @@errors = 0
  end

  def parse(response, url, data: {})
    #From main page we get links to all top-level genres
    genre_links = response.css('a.top-level-genre')
          
    #From main page we get links to all sub-genre pages
    sub_genre_links = response.css('ul.top-level-subgenres a')

    genre_links.each do |genre_link|
      url = genre_link['href']
      browser.visit(url)
      parse_podcast(browser.current_response, url: url)
    end

    sub_genre_links.each do |sub_genre_link|
      url = sub_genre_link['href']
      browser.visit(url)
      parse_podcast(browser.current_response, url: url)
    end
  end

  def parse_podcast(response, url:, **data)

    def strip_id_from_link(link)
      link_list = link.split('/')
      raw_id = link_list[-1]
      raw_id.slice!('id')
      return raw_id
    end

    @@total_pods += response.css('div#selectedcontent a').count
    response.css('div#selectedcontent a').each do |link|
      id = strip_id_from_link(link['href'])
      url = "https://itunes.apple.com/lookup?id=#{id}"
      if @@podcast_ids.include?(id)
        @@podcasts_rejected += 1
        next
      end
      browser.visit(url) 
      parse_lookup(browser.current_response, url:url, **{id:id})
    end
    
  end

  def parse_lookup(response, url:, **data)
    json_hash = JSON.parse(response.css('body').inner_text)
    results_hash = json_hash['results'][0]
    feed_url = results_hash['feedUrl']
    genres = results_hash['genres']
    podcast_name = results_hash['collectionName']
    if feed_url.nil?
      @@errors += 1
      return
    else
      parse_rss(url: feed_url, **{id: data[:id], genres: genres}) 
    end
  end

  def parse_rss(url:, **data)
    begin
      feed = RSS::Parser.parse(url, do_validate=false)
    rescue RSS::Error, OpenURI::HTTPError, SocketError, Errno::ECONNRESET, Timeout::Error, RuntimeError
      @@errors += 1
      return
    end
    podcast = {}
    podcast["id"] = data[:id]
    podcast["title"] = feed.channel.title 
    podcast["subtitle"] = feed.channel.itunes_subtitle 
    podcast["rss_feed_link"] = url
    podcast["link"] = feed.channel.link 
    podcast["itunes_categories"] = data[:genres]
    podcast["image_url"] = feed.channel.image&.url 
    podcast["image_title"] = feed.channel.image&.title 
    podcast["last_build_date"] = feed.channel.lastBuildDate 
    podcast["author_name"] = feed.channel.itunes_author 
    podcast["description"] = feed.channel.description 
    podcast["language"] = feed.channel.language 
    podcast["itunes_summary"] = feed.channel.itunes_summary 
    podcast["pub_date"] = feed.channel.pubDate 
    podcast["slug"] = nil
    p = Podcast.create(podcast)
    if p.persisted?
      @@podcasts_added << p
    end
  end

  def self.close_spider
    puts "#{@@podcasts_added.count} podcasts added"
    puts "#{@@podcasts_rejected} podcasts rejected"
    puts "#{@@total_pods} extracted"
    puts "#{@@errors} errors"
  end

end
