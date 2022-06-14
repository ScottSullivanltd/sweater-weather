require "rails_helper"

RSpec.describe BreweriesFacade do
  describe "class methods" do
    it ".get_location_breweries", :vcr do
      location = "denver"
      quantity = 5
      brewery = BreweriesFacade.get_location_breweries(location, quantity)
      expect(brewery).to be_a(Brewery)
    end
  end
end
