class BreweriesFacade
  def self.get_location_breweries(location, quantity)
    brewery_data = BreweryService.get_breweries(location)
    Brewery.new(brewery_data[0])
  end
end
