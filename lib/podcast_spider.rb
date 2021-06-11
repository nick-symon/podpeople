require 'kimurai'

class PodcastSpider < Kimurai::Base
  @engine = :mechanize
  @start_urls = ["https://podcasts.apple.com/us/genre/podcasts/id26"]

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

    puts url
    def strip_id_from_link(link)
      link_list = link.split('/')
      raw_id = link_list[-1]
      raw_id.slice!('id')
      return raw_id
    end

    response.css('div#selectedcontent a').each do |link|
      id = strip_id_from_link(link['href'])
      url = "https://itunes.apple.com/lookup?id=#{id}"
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
    browser.visit(feed_url)
    parse_final(browser.current_response, url: feed_url, **{id: data[:id], genres: genres}) 
  end

  def parse_final(response, url:, **data)
    podcast = {}
    podcast["id"] = data[:id]
    podcast["title"] = response.xpath('//channel/title').inner_text 
    podcast["subtitle"] = response.xpath('//channel/itunes:subtitle', 'itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd').inner_text 
    podcast["rss_feed_link"] = url
    podcast["link"] = response.xpath('//channel/link').inner_text 
    podcast["itunes_categories"] = data[:genres]
    podcast["image_url"] = response.xpath('//channel/image/url').inner_text 
    podcast["image_title"] = response.xpath('//channel/image/title').inner_text 
    # thikn we should run below through a parse date fxn
    podcast["last_build_date"] = response.xpath('//channel/lastBuildDate').inner_text 
    podcast["author_name"] = response.xpath('//channel/itunes:author', 'itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd').inner_text 
    podcast["description"] = response.xpath('//channel/description').inner_text 
    podcast["language"] = response.xpath('//channel/language').inner_text 
    podcast["title"] = response.xpath('//channel/title').inner_text
    podcast["itunes_subtitle"] = response.xpath('//channel/itunes:subtitle', 'itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd').inner_text 
    podcast["itunes_summary"] = response.xpath('//channel/itunes:summary', 'itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd').inner_text 
    podcast["pub_date"] = response.xpath('//channel/pubDate').inner_html
    # we can extraxt text from xml using approach below
    # basic use the poddracer script but replace when neede
    # make sure we register namespcaes
    # note that name spacing doesn't currently work and a lot of attirubres aren't getting picked up
    puts podcast
  end

end
