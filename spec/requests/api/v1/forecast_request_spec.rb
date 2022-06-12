require "rails_helper"

# a data attribute, under which all other attributes are present:
# id, always set to null
# type, always set to “forecast”
# attributes, an object containing weather information:
# current_weather, holds current weather data:
# datetime, in a human-readable format such as “2020-09-30 13:27:03 -0600”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# temperature, floating point number indicating the current temperature in Fahrenheit
# feels_like, floating point number indicating a temperature in Fahrenheit
# humidity, numeric (int or float), as given by OpenWeather
# uvi, numeric (int or float), as given by OpenWeather
# visibility, numeric (int or float), as given by OpenWeather
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather

RSpec.describe "Forecast API" do
  describe "current weather" do
    it "successfully returns current weather for given location" do
      null = nil
      response = {
        data: {
          id: null,
          type: "forecast",
          attributes: {
            current_weather: {
              datetime: "2020-09-30 13:27:03 -0600",
              sunrise: 1654947095,
              sunset: 1655000870,
              temperature: 79.4,
              feels_like: 78.71,
              humidity: 24,
              uvi: 0,
              visibility: 10000,
              weather: [
                {
                  description: "scattered clouds",
                  icon: "03n"
                }
              ]
            }
          }
        }
      }
      get "/api/v1/forecast?location=denver,co"

      data = response[:data]
      expect(data).to have_key(:id)
      expect(data[:id]).to be(nil)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("forecast")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to have_key(:current_weather)

      weather_now = data[:attributes][:current_weather]
      expect(weather_now).to have_key(:datetime)
      expect(weather_now[:datetime]).to be_a(String)
      expect(weather_now).to have_key(:sunrise)
      expect(weather_now[:sunrise]).to be_an(String)
      expect(weather_now).to have_key(:sunset)
      expect(weather_now[:sunset]).to be_a(String)
      expect(weather_now).to have_key(:temperature)
      expect(weather_now[:temperature]).to be_a(Float)
      expect(weather_now).to have_key(:feels_like)
      expect(weather_now[:feels_like]).to be_a(Float)
      expect(weather_now).to have_key(:humidity)
      expect(weather_now[:humidity]).to be_a(Numeric)
      expect(weather_now).to have_key(:uvi)
      expect(weather_now[:uvi]).to be_a(Numeric)
      expect(weather_now).to have_key(:visibility)
      expect(weather_now[:visibility]).to be_a(Numeric)
      expect(weather_now).to have_key(:weather)
      expect(weather_now[:weather]).to be_an(Array)

      weather = weather_now[:weather]
      expect(weather[0]).to have_key(:description)
      expect(weather[0][:description]).to be_a(String)
      expect(weather[0]).to have_key(:icon)
      expect(weather[0][:icon]).to be_a(String)
    end
  end
end
