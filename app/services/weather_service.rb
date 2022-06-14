class WeatherService < BaseService
  def self.get_weather_forecast(lat, lng, units = "imperial")
    response = conn("https://api.openweathermap.org").get("/data/2.5/onecall") do |f|
      f.params["lat"] = lat
      f.params["lon"] = lng
      f.params["exclude"] = "minutely,alerts"
      f.params["appid"] = ENV["weather_key"]
      f.params["units"] = units
    end
    get_json(response)
  end
end
