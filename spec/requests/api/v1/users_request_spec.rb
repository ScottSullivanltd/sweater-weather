require "rails_helper"

RSpec.describe "Users Registration" do
  it "successfully creates users", :vcr do
    user = User.create!(email: "popp@catmail.com", password: "password", password_confirmation: "password", api_key: "jgn983hy48thw9begh98h4539h4")

    request = {
      email: user.email,
      password: user.password,
      password_confirmation: user.password_confirmation
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
    expect(user.email).to eq("popp@catmail.com")
    expect(user.password).to eq("password")
  end

  xit "does not create user if bad credentials", :vcr do
    user = User.create!(email: "popp@catmail.com", password: "password", password_confirmation: "password12", api_key: "jgn983hy48thw9begh98h4539h4")

    request = {
      email: user.email,
      password: user.password,
      password_confirmation: user.password_confirmation
    }

    post "/api/v1/users", params: request, as: :json

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

    expect(response).to have_http_status(400)
    expect(json).to be_a(Hash)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("users")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes]).to have_key(:api_key)
    expect(user.email).to eq("popp@catmail.com")
    expect(user.password).to eq("password")
  end
end
