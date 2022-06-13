class ForecastFacade
  def self.get_response_data(location)
    mapquest_data = MapService.get_lat_long(location)

    WeatherService.get_weather_forecast(mapquest_data[:lat], mapquest_data[:lng])
  end

  def self.get_forecast(location)
    weather_data = get_response_data(location)

    AllWeather.new(weather_data)
  end
end
