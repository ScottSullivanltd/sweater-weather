require "rails_helper"

RSpec.describe "Users Registration" do
  describe "register users" do
    it "successfully registers users", :vcr do
      request = {
        email: "popp@catmain.com",
        password: "password",
        password_confirmation: "password"
      }

      expect(User.count).to eq(0)

      post "/api/v1/users", params: request, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:created)
      expect(User.count).to eq(1)

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      expect(json).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("users")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)
      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes][:email]).to be_a(String)
      expect(data[:attributes]).to have_key(:api_key)
      expect(data[:attributes][:api_key]).to be_a(String)
    end

    it "does not expose sensitive data", :vcr do
      request = {
        email: "popp@catmain.com",
        password: "password",
        password_confirmation: "password"
      }

      post "/api/v1/users", params: request, as: :json

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      expect(data).to_not have_key(:password)
      expect(data).to_not have_key(:password_confirmation)
      expect(data).to_not have_key(:password_digest)
    end
  end

  describe "sad path tests" do
    it "returns error if passwords don't match", :vcr do
      request = {
        email: "popp@catmain.com",
        password: "password",
        password_confirmation: "Password"
      }

      post "/api/v1/users", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "returns error if a field is missing", :vcr do
      request = {
        email: "popp@catemail.com",
        password: "password"
      }

      post "/api/v1/users", params: request, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "returns error if no params are passed", :vcr do
      request = {
        email: "popp@catmain.com",
        password: "password",
        password_confirmation: "Password"
      }

      post "/api/v1/users", params: ""

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end
  end
end
