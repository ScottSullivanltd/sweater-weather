class Roadtrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(attr)
    @start_city = attr[:start_city]
    @end_city = attr[:end_city]
    @travel_time = attr[:travel_time]
    @weather_at_eta = attr[:weather_at_eta]
  end
end
