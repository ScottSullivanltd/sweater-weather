require "rails_helper"

RSpec.describe "Backgrounds API" do
  describe "current weather" do
    it "successfully returns background pictures for given location", :vcr do
      location_params = {
        location: "denver,co"
      }

      get "/api/v1/backgrounds", params: location_params

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      aggregate_failures do
        expect(data).to have_key(:id)
        expect(data[:id]).to be(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("image")
        expect(data).to have_key(:attributes)

        image = data[:attributes]
        expect(image).to have_key(:description)
        expect(image[:description]).to be_a(String)
        expect(image).to have_key(:url)
        expect(image[:url]).to be_an(String)
        # require "pry"
        # binding.pry
        # expect(image).to have_key(:source)
        # expect(image[:source]).to be_a(String)
        expect(image).to have_key(:author)
        expect(image[:author]).to be_a(String)
        expect(image).to have_key(:alt_description)
        expect(image[:alt_description]).to be_a(String)
        expect(image).to have_key(:portfolio)
        expect(image[:portfolio]).to be_a(String)
      end
    end
  end
end
