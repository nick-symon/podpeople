module EpisodesHelper
  def format_published_date(date)
    parsed_date = DateTime.parse(date)
    parsed_date.strftime("%b %-d, %Y")
  end
end
