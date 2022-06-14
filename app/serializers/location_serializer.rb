class LocationSerializer
  def self.location_info(weather, location, books)
    {
      data: {
        id: nil,
        type: "breweries",
        attributes: {
          destination: location,
          forecast: {
            summary: weather.current_weather.conditions,
            temperature: weather.current_weather.temperature
          },
          breweries: breweries.map do |brewery|
                       {
                         id: brewery.brewery_id,
                         name: brewery.name,
                         brewery_type: brewery.brewery_type
                       }
                     end
        }
      }
    }
  end
end
