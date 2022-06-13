class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon

  def initialize(attr)
    @datetime = Time.at(attr[:dt]).utc.strftime("%FT %T %:z")
    @sunrise = Time.at(attr[:sunrise]).utc.strftime("%FT %T %:z")
    @sunset = Time.at(attr[:sunset]).utc.strftime("%FT %T %:z")
    @temperature = attr[:temp]
    @feels_like = attr[:feels_like]
    @humidity = attr[:humidity]
    @uvi = attr[:uvi]
    @visibility = attr[:visibility]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
