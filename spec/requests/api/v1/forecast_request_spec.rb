require "rails_helper"

RSpec.describe "Forecast API" do
  describe "weather info" do
    it "successfully returns current, daily, and hourly weather for given location", :vcr do
      location_params = {
        location: "denver,co"
      }

      get "/api/v1/forecast", params: location_params

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      aggregate_failures do
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
        expect(weather_now).to have_key(:conditions)
        expect(weather_now[:conditions]).to be_a(String)
        expect(weather_now).to have_key(:icon)
        expect(weather_now[:icon]).to be_a(String)

        weather_daily = data[:attributes][:daily_weather]
        expect(weather_daily.count).to eq(5)
        expect(weather_daily[0]).to have_key(:date)
        expect(weather_daily[0][:date]).to be_a(String)
        expect(weather_daily[0]).to have_key(:sunrise)
        expect(weather_daily[0][:sunrise]).to be_an(String)
        expect(weather_daily[0]).to have_key(:sunset)
        expect(weather_daily[0][:sunset]).to be_a(String)
        expect(weather_daily[0]).to have_key(:max_temp)
        expect(weather_daily[0][:max_temp]).to be_a(Float)
        expect(weather_daily[0]).to have_key(:min_temp)
        expect(weather_daily[0][:min_temp]).to be_a(Float)
        expect(weather_daily[0]).to have_key(:conditions)
        expect(weather_daily[0][:conditions]).to be_a(String)
        expect(weather_daily[0]).to have_key(:icon)
        expect(weather_daily[0][:icon]).to be_a(String)

        weather_hourly = data[:attributes][:hourly_weather]
        expect(weather_hourly.count).to eq(8)
        expect(weather_hourly[0]).to have_key(:time)
        expect(weather_hourly[0][:time]).to be_a(String)
        expect(weather_hourly[0]).to have_key(:temperature)
        expect(weather_hourly[0][:temperature]).to be_a(Float)
        expect(weather_hourly[0]).to have_key(:conditions)
        expect(weather_hourly[0][:conditions]).to be_a(String)
        expect(weather_hourly[0]).to have_key(:icon)
        expect(weather_hourly[0][:icon]).to be_a(String)
      end
    end

    it "only sends neccessary info" do
      location_params = {
        location: "denver,co"
      }

      get "/api/v1/forecast", params: location_params

      json = JSON.parse(response.body, symbolize_names: true)
      weather = json[:data]

      expect(weather).to_not have_key(:moonrise)
      expect(weather).to_not have_key(:moonset)
      expect(weather).to_not have_key(:moonphase)
      expect(weather).to_not have_key(:pressure)
      expect(weather).to_not have_key(:wind_deg)
      expect(weather).to_not have_key(:wind_gust)
      expect(weather).to_not have_key(:dew_point)
    end

    it "can send optional unit params for metric", :vcr do
      location_params = {
        location: "denver,co",
        units: "metric"
      }

      get "/api/v1/forecast", params: location_params

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      aggregate_failures do
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
        expect(weather_now).to have_key(:conditions)
        expect(weather_now[:conditions]).to be_a(String)
        expect(weather_now).to have_key(:icon)
        expect(weather_now[:icon]).to be_a(String)

        weather_daily = data[:attributes][:daily_weather]
        expect(weather_daily.count).to eq(5)
        expect(weather_daily[0]).to have_key(:date)
        expect(weather_daily[0][:date]).to be_a(String)
        expect(weather_daily[0]).to have_key(:sunrise)
        expect(weather_daily[0][:sunrise]).to be_an(String)
        expect(weather_daily[0]).to have_key(:sunset)
        expect(weather_daily[0][:sunset]).to be_a(String)
        expect(weather_daily[0]).to have_key(:max_temp)
        expect(weather_daily[0][:max_temp]).to be_a(Float)
        expect(weather_daily[0]).to have_key(:min_temp)
        expect(weather_daily[0][:min_temp]).to be_a(Float)
        expect(weather_daily[0]).to have_key(:conditions)
        expect(weather_daily[0][:conditions]).to be_a(String)
        expect(weather_daily[0]).to have_key(:icon)
        expect(weather_daily[0][:icon]).to be_a(String)

        weather_hourly = data[:attributes][:hourly_weather]
        expect(weather_hourly.count).to eq(8)
        expect(weather_hourly[0]).to have_key(:time)
        expect(weather_hourly[0][:time]).to be_a(String)
        expect(weather_hourly[0]).to have_key(:temperature)
        expect(weather_hourly[0][:temperature]).to be_a(Float)
        expect(weather_hourly[0]).to have_key(:conditions)
        expect(weather_hourly[0][:conditions]).to be_a(String)
        expect(weather_hourly[0]).to have_key(:icon)
        expect(weather_hourly[0][:icon]).to be_a(String)
      end
    end
  end

  describe "sad paths" do
    it "returns an error if no location is found", :vcr do
      get "/api/v1/forecast"

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end
  end
end
