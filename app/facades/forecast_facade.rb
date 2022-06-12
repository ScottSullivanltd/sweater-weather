class ForecastFacade
  def self.get_forecast(city, state)

    mapquest_data = MapService.get_lat_long(city, state)

    weather_data = WeatherService.current_weather(mapquest_data[:lat], mapquest_data[:long])
    current_attr = weather_data[:current]
    daily_attr = weather_data[:daily][0,1,2,3,4]
    hourly_attr = weather_data[:hourly][0,1,2,3,4]


    attr = {
      current_weather: {
        datetime: current_attr[:dt],
        sunrise: current_attr[:sunrise],
        sunset: current_attr[:sunset],
        temperature: current_attr[:temp],
        feels_like: current_attr[:feels_like],
        humidity: current_attr[:humidity],
        uvi: current_attr[:uvi],
        visibility: current_attr[:visibility],
        description: current_attr[:weather][:description],          {
        icon: current_attr[:weather][:icon]
      },
      daily_weather: {
        date: daily_attr[:dt],
        sunrise: daily_attr[:sunrise],
        sunset: daily_attr[:sunset],
        max_temp: daily_attr[:temp][:max],
        min_temp: daily_attr[:temp][:min],
        conditions: daily_attr[:weather][0][:description],
        icon: daily_attr[:weather][0][:icon]
      },
      hourly_weather: {
        time: hourly_attr[:dt],
        temp: hourly_attr[:temp],
        conditions: hourly_attr[:weather][0][:description],
        icon: hourly_attr[:weather][0][:icon]
      }
    }

    Forecast.new(attr)
  end
end
