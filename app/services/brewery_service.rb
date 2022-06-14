class BreweryService < BaseService
  def self.get_breweries(location)
    response = conn("https://api.openbrewerydb.org").get("/breweries") do |f|
      f.params["by_city"] = location
      f.params["per_page"] = 5
    end
    get_json(response)
  end
end
