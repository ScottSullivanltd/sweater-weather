require "rails_helper"

RSpec.describe "Users Registration" do
  it "successfully creates users", :vcr do
    request = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post "/api/v1/users", params: request, as: :json

    expect(response).to have_http_status(:created)
  end
end
