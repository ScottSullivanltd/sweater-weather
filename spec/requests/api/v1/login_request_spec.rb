require "rails_helper"

RSpec.describe "Users Login" do
  xit "successfully logs in users", :vcr do
    request = {
      email: "whatever@example.com",
      password: "password"
    }

    post "/api/v1/sessions", params: request, as: :json

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

    expect(response).to have_http_status(:ok)
    expect(json).to be_a(Hash)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("users")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes]).to have_key(:api_key)
  end
end
