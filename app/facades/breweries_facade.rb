class BreweriesFacade
  def self.get_location_breweries(location, quantity)
    brewery_data = BreweryService.get_breweries(location)

    breweries = []
    brewery_data.first(quantity.to_i).map do |brewery|
      breweries << Brewery.new(brewery)
    end
    breweries
  end
end
