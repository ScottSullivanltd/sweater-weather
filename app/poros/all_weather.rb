class AllWeather
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather

  def initialize(attr)
    @current_weather = CurrentWeather.new(attr[:current])
    @daily_weather = create_daily_weather(attr[:daily])
    @hourly_weather = create_hourly_weather(attr[:hourly])
  end

  def create_daily_weather(data)
    data[0..4].map do |forecast|
      DailyWeather.new(forecast)
    end
  end

  def create_hourly_weather(data)
    data[0..7].map do |forecast|
      HourlyWeather.new(forecast)
    end
  end
end
