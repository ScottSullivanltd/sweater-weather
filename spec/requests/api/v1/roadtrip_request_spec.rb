require "rails_helper"

RSpec.describe "Roadtrip" do
  describe "create a Roadtrip" do
    it "sends roadtrip information", :vcr do
      user = create(:user)

      request = {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: user.api_key
      }

      post "/api/v1/road_trip", params: request, as: :json

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)
      expect(data[:type]).to eq("roadtrip")
      expect(data[:type]).to be_a(String)
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)
      expect(data[:attributes]).to have_key(:start_city)
      expect(data[:attributes][:start_city]).to be_a(String)
      expect(data[:attributes]).to have_key(:end_city)
      expect(data[:attributes][:end_city]).to be_a(String)
      expect(data[:attributes]).to have_key(:travel_time)
      expect(data[:attributes][:travel_time]).to be_a(String)
      expect(data[:attributes]).to have_key(:weather_at_eta)
      expect(data[:attributes][:weather_at_eta]).to be_a(Hash)
      expect(data[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(data[:attributes][:weather_at_eta]).to have_key(:condition)
      expect(data[:attributes][:weather_at_eta][:condition]).to be_a(String)
    end
  end

  describe "sad path tests" do
    it "does not send roadtrip info if api key is invalid", :vcr do
      user = create(:user)

      request = {
        origin: "Denver, CO",
        destination: "Estes Park, CO",
        api_key: "p035fdjukew77vv"
      }

      post "/api/v1/road_trip", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "does not send roadtrip info if no origin is given", :vcr do
      user = create(:user)

      request = {
        destination: "Estes Park, CO",
        api_key: user.api_key
      }

      post "/api/v1/road_trip", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "does not send roadtrip info if no destination is given", :vcr do
      user = create(:user)

      request = {
        origin: "Denver, CO",
        api_key: user.api_key
      }

      post "/api/v1/road_trip", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    xit "does not send roadtrip info if a route does not exist", :vcr do
      user = create(:user)

      request = {
        origin: "Denver, CO",
        destination: "london",
        api_key: user.api_key
      }

      post "/api/v1/road_trip", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end
  end
end
