require "rails_helper"

RSpec.describe Roadtrip do
  it "exists and has attributes" do
    attr = {
      start_city: "Denver, CO",
      end_city: "Estes Park, CO",
      travel_time: "2 hours, 13 minutes",
      weather_at_eta: {
        temperature: 59.4,
        conditions: "partly cloudy with a chance of meatballs"
      }
    }

    roadtrip = Roadtrip.new(attr)

    expect(roadtrip.start_city).to eq("Denver, CO")
    expect(roadtrip.end_city).to eq("Estes Park, CO")
    expect(roadtrip.travel_time).to eq("2 hours, 13 minutes")
    expect(roadtrip.weather_at_eta[:temperature]).to eq(59.4)
    expect(roadtrip.weather_at_eta[:conditions]).to eq("partly cloudy with a chance of meatballs")
  end
end
