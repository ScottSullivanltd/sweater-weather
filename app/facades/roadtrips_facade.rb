class RoadtripsFacade
  def self.get_directions(from, to)
    MapService.get_directions_info(from, to)
  end

  def self.get_weather(lat, lng)
    WeatherService.get_weather_forecast(lat, lng)
  end

  def self.get_origin(from, to)
    directions = get_directions(from, to)
    directions[:route][:locations][0][:adminArea5] + ", " + directions[:route][:locations][0][:adminArea3]
  end

  def self.get_destination(from, to)
    directions = get_directions(from, to)
    directions[:route][:locations][1][:adminArea5] + ", " + directions[:route][:locations][1][:adminArea3]
  end

  def self.get_travel_time(from, to)
    directions = get_directions(from, to)
    time = directions[:route][:formattedTime]
    time.split(":").map(&:to_i)
  end

  def self.format_travel_time(from, to)
    time = get_travel_time(from, to)
    hours, minutes, seconds = time
    "#{hours} Hours, #{minutes} Minutes"
  end

  def self.get_destination_weather_temp(from, to)
    location = MapService.get_lat_long(to)
    lat = location[:lat]
    lng = location[:lng]
    json = WeatherService.get_weather_forecast(lat, lng)
    time = get_travel_time(from, to)

    time[0] <= 47 ? hourly_weather_temp(json, time) : daily_weather_temp(json, time)
  end

  def self.get_destination_weather_conditions(from, to)
    location = MapService.get_lat_long(to)
    lat = location[:lat]
    lng = location[:lng]
    json = WeatherService.get_weather_forecast(lat, lng)
    time = get_travel_time(from, to)

    time[0] <= 47 ? hourly_weather_conditions(json, time) : daily_weather_conditions(json, time)
  end

  def self.hourly_weather_temp(data, time)
    time[1] > 30 ? data[:hourly][time[0] + 1][:temp].round(1) : data[:hourly][time[0]][:temp].round(1)
  end

  def self.hourly_weather_conditions(data, time)
    time[1] > 30 ? data[:hourly][time[0] + 1][:weather][0][:description] : data[:hourly][time[0]][:weather][0][:description]
  end

  def self.daily_weather_temp(data, time)
    daily_time = (time[0] / 24).round
    data[:daily][daily_time][:temp][:day].round(1)
  end

  def self.daily_weather_conditions(data, time)
    daily_time = (time[0] / 24).round
    data[:daily][daily_time][:weather][0][:description]
  end

  def self.create_destination_info(from, to)
    {
      start_city: get_origin(from, to),
      end_city: get_destination(from, to),
      travel_time: format_travel_time(from, to),
      weather_at_eta: {
        temperature: get_destination_weather_temp(from, to),
        condition: get_destination_weather_conditions(from, to)
      }
    }
  end

  def self.create_roadtrip(from, to)
    json = get_directions(from, to)
    json[:route][:routeError][:errorCode] == 2 ? nil : Roadtrip.new(create_destination_info(from, to))
  end
end
