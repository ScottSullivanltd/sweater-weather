require "rails_helper"

RSpec.describe MapService do
  describe "class methods" do
    it ".get_lat_long", :vcr do
      location = "denver,co"

      response = MapService.get_lat_long(location)

      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Numeric)
      expect(response).to have_key(:lng)
      expect(response[:lng]).to be_a(Numeric)
    end

    it ".get_directions_info", :vcr do
      from = "denver,co"
      to = "estes park, co"

      response = MapService.get_directions_info(from, to)

      expect(response).to have_key(:route)
      expect(response[:route]).to be_a(Hash)
      expect(response[:route]).to have_key(:formattedTime)
      expect(response[:route][:formattedTime]).to be_a(String)

      expect(response[:route]).to have_key(:locations)
      expect(response[:route][:locations].class).to eq(Array)
      expect(response[:route][:locations][0]).to have_key(:adminArea5)
      expect(response[:route][:locations][0][:adminArea5].class).to eq(String)
      expect(response[:route][:locations][0]).to have_key(:adminArea3)
      expect(response[:route][:locations][0][:adminArea3].class).to eq(String)
    end
  end
end
