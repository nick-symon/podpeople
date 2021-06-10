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
      request_to :parse_podcast, url: genre_link['href']
    end

    sub_genre_links.each do |sub_genre_link|
      request_to :parse_podcast, url: sub_genre_link['href']
    end
  end

  def parse_podcast(response, url, data: {})

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
      request_to :parse_lookup, url: url, data: {id: id}
    end
    
  end

  def parse_lookup(response, url, data: {})
    json_hash = JSON.parse(response.css('body').inner_text)
    results_hash = json_hash['results'][0]
    feed_url = results_hash['feedUrl']
    genres = results_hash['genres']
    podcast_name = results_hash['collectionName']
    request_to :parse_final, url: feed_url, data: {id: data[:id], genres: genres}
  end

  def parse_final(response, url, data: {})
    puts response
  end

end
