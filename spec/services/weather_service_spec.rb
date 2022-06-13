require "rails_helper"

RSpec.describe WeatherService do
  describe "class methods" do
    it "current_weather", :vcr do
      lat = 39.738453
      lng = -104.984853

      response = WeatherService.get_weather_forecast(lat, lng)

      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)
      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an(Array)
      expect(response).to have_key(:hourly)
      expect(response[:hourly]).to be_an(Array)

      weather_now = response[:current]
      expect(weather_now).to have_key(:dt)
      expect(weather_now[:dt]).to be_a(Numeric)
      expect(weather_now).to have_key(:sunrise)
      expect(weather_now[:sunrise]).to be_an(Numeric)
      expect(weather_now).to have_key(:sunset)
      expect(weather_now[:sunset]).to be_a(Numeric)
      expect(weather_now).to have_key(:temp)
      expect(weather_now[:temp]).to be_a(Float)
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
      expect(weather_now[:weather][0]).to have_key(:description)
      expect(weather_now[:weather][0][:description]).to be_a(String)
      expect(weather_now[:weather][0]).to have_key(:icon)
      expect(weather_now[:weather][0][:icon]).to be_a(String)

      weather_daily = response[:daily][0]
      expect(weather_daily).to have_key(:dt)
      expect(weather_daily[:dt]).to be_a(Numeric)
      expect(weather_daily).to have_key(:sunrise)
      expect(weather_daily[:sunrise]).to be_an(Numeric)
      expect(weather_daily).to have_key(:sunset)
      expect(weather_daily[:sunset]).to be_a(Numeric)
      expect(weather_daily[:temp]).to have_key(:max)
      expect(weather_daily[:temp][:max]).to be_a(Float)
      expect(weather_daily[:temp]).to have_key(:min)
      expect(weather_daily[:temp][:min]).to be_a(Float)
      expect(weather_now).to have_key(:weather)
      expect(weather_now[:weather]).to be_an(Array)
      expect(weather_daily[:weather][0]).to have_key(:description)
      expect(weather_daily[:weather][0][:description]).to be_a(String)
      expect(weather_daily[:weather][0]).to have_key(:icon)
      expect(weather_daily[:weather][0][:icon]).to be_a(String)

      weather_hourly = response[:hourly][0]
      expect(weather_hourly).to have_key(:dt)
      expect(weather_hourly[:dt]).to be_a(Numeric)
      expect(weather_hourly).to have_key(:temp)
      expect(weather_hourly[:temp]).to be_a(Float)
      expect(weather_now).to have_key(:weather)
      expect(weather_now[:weather]).to be_an(Array)
      expect(weather_hourly[:weather][0]).to have_key(:description)
      expect(weather_hourly[:weather][0][:description]).to be_a(String)
      expect(weather_hourly[:weather][0]).to have_key(:icon)
      expect(weather_hourly[:weather][0][:icon]).to be_a(String)
    end
  end
end
