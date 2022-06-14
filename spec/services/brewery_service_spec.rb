require "rails_helper"

RSpec.describe BreweryService do
  describe "class methods" do
    it "get_breweries", :vcr do
      location = "denver"

      response = BreweryService.get_breweries(location)
      result = response[0]

      expect(result).to have_key(:id)
      expect(result[:id]).to be_a(String)
      expect(result).to have_key(:name)
      expect(result[:name]).to be_a(String)
      expect(result).to have_key(:brewery_type)
      expect(result[:brewery_type]).to be_a(String)
    end
  end
end
