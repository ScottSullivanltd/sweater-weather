require "rails_helper"

RSpec.describe "Users Login" do
  describe "happy path" do
    it "successfully logs in users", :vcr do
      user = create(:user)

      request = {
        email: user.email,
        password: user.password,
        password_confirmation: user.password
      }

      post "/api/v1/sessions", params: request, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      expect(json).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("users")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)
      expect(data[:attributes]).to have_key(:email)
      expect(data[:attributes]).to have_key(:api_key)
    end

    it "does not expose sensitive data", :vcr do
      user = create(:user)

      request = {
        email: user.email,
        password: user.password,
        password_confirmation: user.password
      }

      post "/api/v1/sessions", params: request, as: :json

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      expect(data).to_not have_key(:password)
      expect(data).to_not have_key(:password_confirmation)
      expect(data).to_not have_key(:password_digest)
    end
  end

  describe "sad path" do
    it "sends an error message if password is invalid", :vcr do
      user = create(:user)

      request = {
        email: user.email,
        password: "iliketurtles"
      }

      post "/api/v1/sessions", params: request, as: :json

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "sends an error message if email is invalid", :vcr do
      user = create(:user)

      request = {
        email: "test@error.com",
        password: user.password
      }

      post "/api/v1/sessions", params: request, as: :json

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end

    it "sends an error message if both password and email are invalid", :vcr do
      user = create(:user)

      request = {
        email: "test@error.com",
        password: "password"
      }

      post "/api/v1/sessions", params: request, as: :json

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:error)
    end
  end
end
