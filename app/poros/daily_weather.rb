class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attr)
    @date = Time.at(attr[:dt]).utc.strftime("%F")
    @sunrise = Time.at(attr[:sunrise]).utc.strftime("%FT %T %:z")
    @sunset = Time.at(attr[:sunset]).utc.strftime("%FT %T %:z")
    @max_temp = attr[:temp][:max]
    @min_temp = attr[:temp][:min]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
