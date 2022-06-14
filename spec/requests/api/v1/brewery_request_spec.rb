require "rails_helper"

RSpec.describe "Breweries API" do
  describe "breweries" do
    it "successfully returns list of breweries for given location", :vcr do
      brewery_params = {
        location: "denver",
        quantity: 5
      }

      get "/api/v1/breweries", params: brewery_params

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      aggregate_failures do
        expect(data).to have_key(:id)
        expect(data[:id]).to be(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("breweries")
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to have_key(:destination)
        expect(data[:attributes][:destination]).to be_a(String)
        expect(data[:attributes]).to have_key(:forecast)
        expect(data[:attributes][:forecast]).to be_a(Hash)
        expect(data[:attributes]).to have_key(:breweries)
        expect(data[:attributes][:breweries]).to be_an(Array)

        forecast = data[:attributes][:forecast]
        expect(forecast).to have_key(:summary)
        expect(forecast[:summary]).to be_a(String)
        expect(forecast).to have_key(:temperature)
        expect(forecast[:temperature]).to be_a(Float)

        breweries = data[:attributes][:breweries][0]
        expect(breweries).to have_key(:id)
        expect(breweries[:id]).to be_an(Integer)
        expect(breweries).to have_key(:name)
        expect(breweries[:name]).to be_an(String)
        expect(breweries).to have_key(:brewery_type)
        expect(breweries[:brewery_type]).to be_an(Array)
      end
    end
  end
end
