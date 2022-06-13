require "rails_helper"

RSpec.describe MapService do
  describe "class methods" do
    it "get_lat_long", :vcr do
      location = "denver,co"

      response = MapService.get_lat_long(location)

      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Numeric)
      expect(response).to have_key(:lng)
      expect(response[:lng]).to be_a(Numeric)
    end
  end
end
