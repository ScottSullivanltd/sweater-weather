require "rails_helper"

RSpec.describe DailyWeather do
  it "creates a poro for daily weather", :vcr do
    attr = {
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
    }
    daily_weather = DailyWeather.new(attr)

    expect(daily_weather.date).to eq("2022-06-12")
    expect(daily_weather.sunrise).to eq("2022-06-12T 11:31:30 +00:00")
    expect(daily_weather.sunset).to eq("2022-06-13T 02:28:19 +00:00")
    expect(daily_weather.max_temp).to eq(79.4)
    expect(daily_weather.min_temp).to eq(78.71)
    expect(daily_weather.conditions).to eq("scattered clouds")
    expect(daily_weather.icon).to eq("03n")
  end
end
