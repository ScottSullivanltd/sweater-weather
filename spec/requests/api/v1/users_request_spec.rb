require "rails_helper"

RSpec.describe "Users Registration" do
  it "successfully creates users", :vcr do
    request = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post "/api/v1/users", params: request, as: :json

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

    expect(response).to have_http_status(:created)
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
