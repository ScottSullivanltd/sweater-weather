require "rails_helper"

RSpec.describe AllWeather do
  it "creates a poro for all weather", :vcr do
    attr = {
      current: {
        dt: 1655055025,
        sunrise: 1655033490,
        sunset: 1655087299,
        temp: 79.4,
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
      },
      daily: {
        dt: 1655056800,
        sunrise: 1655033490,
        sunset: 1655087299,
        temp: {
          max: 79.4,
          min: 78.71
        },
        weather: [
          {
            description: "scattered clouds",
            icon: "03n"
          }
        ]
      },
      hourly: {
        dt: 1655053200,
        temp: 79.4,
        weather: [
          {
            description: "scattered clouds",
            icon: "03n"
          }
        ]
      }
    }

    current_weather = CurrentWeather.new(attr[:current])

    expect(current_weather.datetime).to eq("2022-06-12T 17:30:25 +00:00")
    expect(current_weather.sunrise).to eq("2022-06-12T 11:31:30 +00:00")
    expect(current_weather.sunset).to eq("2022-06-13T 02:28:19 +00:00")
    expect(current_weather.temperature).to eq(79.4)
    expect(current_weather.feels_like).to eq(78.71)
    expect(current_weather.humidity).to eq(24)
    expect(current_weather.uvi).to eq(0)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("scattered clouds")
    expect(current_weather.icon).to eq("03n")

    daily_weather = DailyWeather.new(attr[:daily])

    expect(daily_weather.date).to eq("2022-06-12")
    expect(daily_weather.sunrise).to eq("2022-06-12T 11:31:30 +00:00")
    expect(daily_weather.sunset).to eq("2022-06-13T 02:28:19 +00:00")
    expect(daily_weather.max_temp).to eq(79.4)
    expect(daily_weather.min_temp).to eq(78.71)
    expect(daily_weather.conditions).to eq("scattered clouds")
    expect(daily_weather.icon).to eq("03n")

    hourly_weather = HourlyWeather.new(attr[:hourly])

    expect(hourly_weather.time).to eq("17:00:00")
    expect(hourly_weather.temperature).to eq(79.4)
    expect(hourly_weather.conditions).to eq("scattered clouds")
    expect(hourly_weather.icon).to eq("03n")
  end
end
