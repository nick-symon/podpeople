module EpisodesHelper
  def format_published_date(date)
    parsed_date = DateTime.parse(date)
    parsed_date.strftime("%b %-d, %Y")
  end

  def format_duration(duration)
    # if : in string, break apart into array
    if duration.include?(':')
      time_array = duration.split(':')
      if time_array.length > 2
          hour = time_array[0].to_i
          minute = time_array[1].to_i
      else
          minute = time_array[0].to_i
      end
      [].tap do |p|
        p << "#{hour} hour".pluralize(hour) unless hour.zero?
        p << "#{minute} minute".pluralize(minute) unless minute.zero?
      end.join(', ')
    else
      ActiveSupport::Duration
        .build(duration.to_i)
        .parts
        .except(:seconds)
        .reduce("") do | output, (key, val) |
          output += "#{val} #{key}"
        end.strip
    end
  end
end
