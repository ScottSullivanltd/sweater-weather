class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(attr)
    @time = Time.at(attr[:dt]).utc.strftime("%H:%M:%S")
    @temperature = attr[:temp]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
