require "rails_helper"

RSpec.describe HourlyWeather do
  it "creates a poro for hourly weather", :vcr do
    attr = {
      dt: 1655053200,
      temp: 79.4,
      weather: [
        {
          description: "scattered clouds",
          icon: "03n"
        }
      ]
    }
    hourly_weather = HourlyWeather.new(attr)

    expect(hourly_weather.time).to eq("17:00:00")
    expect(hourly_weather.temperature).to eq(79.4)
    expect(hourly_weather.conditions).to eq("scattered clouds")
    expect(hourly_weather.icon).to eq("03n")
  end
end
