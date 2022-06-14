require "rails_helper"

RSpec.describe BreweryService do
  describe "class methods" do
    it "get_breweries", :vcr do
      location = "denver"

      response = BreweryService.get_breweries(location)
      results = response[:docs][0]

      expect(results).to have_key(:name)
      expect(results[:name]).to be_a(String)
      expect(results).to have_key(:brewery_type)
      expect(results[:brewery_type]).to be_a(String)
    end
  end
end
