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
      require "pry"
      binding.pry
      aggregate_failures do
        expect(data).to have_key(:id)
        expect(data[:id]).to be(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("image")
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to have_key(:image)

        image = data[:attributes][:image]
        expect(image).to have_key(:location)
        expect(image[:location]).to be_a(String)
        expect(image).to have_key(:image_url)
        expect(image[:image_url]).to be_an(String)
        expect(image).to have_key(:credit)
        expect(image[:credit]).to be_a(Hash)

        credit = image[:credit][:source]
        expect(credit).to have_key(:source)
        expect(credit[:source]).to be_a(String)
        expect(credit).to have_key(:author)
        expect(credit[:author]).to be_a(String)
      end
    end
  end
end
