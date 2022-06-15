require "rails_helper"

RSpec.describe RoadtripsFacade do
  describe "class methods" do
    it ".get_directions", :vcr do
      expect(RoadtripsFacade.get_directions("denver, co", "estes park, co")).to have_key(:route)
    end

    it ".get_weather", :vcr do
      expect(RoadtripsFacade.get_weather("39.738453", "-104.984853")).to eq(WeatherService.get_weather_forecast("39.738453", "-104.984853"))
    end

    it ".get_origin", :vcr do
      origin = "Denver, CO"
      expect(RoadtripsFacade.get_origin("denver, co", "estes park, co")).to eq(origin)
    end

    it ".get_destination", :vcr do
      destination = "Estes Park, CO"
      expect(RoadtripsFacade.get_destination("denver, co", "estes park, co")).to eq(destination)
    end

    it ".get_travel_time", :vcr do
      time = [1, 19, 42]
      expect(RoadtripsFacade.get_travel_time("denver, co", "estes park, co")).to eq(time)
    end

    it ".format_travel_time", :vcr do
      time = "1 Hours, 19 Minutes"
      expect(RoadtripsFacade.format_travel_time("denver, co", "estes park, co")).to eq(time)
    end

    it ".get_destination_weather_temp", :vcr do
      weather = RoadtripsFacade.get_destination_weather_temp("denver, co", "estes park, co")
      expect(weather).to eq(45.1)
    end

    it ".get_destination_weather_conditions", :vcr do
      allow(RoadtripsFacade).to receive(:get_travel_time).and_return([1, 20, 15])
      weather = RoadtripsFacade.get_destination_weather_conditions("denver, co", "estes park, co")
      expect(weather).to eq("clear sky")
    end

    xit ".daily_weather_temp", :vcr do
      time = [1, 20, 15]
      allow(RoadtripsFacade).to receive(:get_travel_time).and_return(time)

      response = File.read("spec/fixtures/get_destination_weather_temp.yml")
      data = JSON.parse(response, symbolize_names: true)

      weather = RoadtripsFacade.daily_weather_temp(data, time)

      expect(weather).to eq(85.0)
    end

    xit ".daily_weather_conditions", :vcr do
      time = [51, 20, 15]
      allow(RoadtripsFacade).to receive(:get_travel_time).and_return(time)

      response = File.read("spec/fixtures/get_destination_weather_conditions.yml")
      data = JSON.parse(response, symbolize_names: true)

      weather = RoadtripsFacade.daily_weather_conditions(data, time)

      expect(weather).to eq("clear sky")
    end

    it ".create_destination_info", :vcr do
      expected = {
        start_city: "Denver, CO",
        end_city: "Estes Park, CO",
        travel_time: "1 Hours, 19 Minutes",
        weather_at_eta: {
          temperature: 45.1,
          condition: "clear sky"
        }
      }

      expect(RoadtripsFacade.create_destination_info("denver,co", "estes park,co")).to eq(expected)
    end

    it ".create_roadtrip", :vcr do
      road_trip = RoadtripsFacade.create_roadtrip("denver,co", "estes park,co")
      expect(road_trip).to be_an_instance_of(Roadtrip)
    end

    it "returns nil if route doesn't exist", :vcr do
      road_trip = RoadtripsFacade.create_roadtrip("denver,co", "london")

      expect(road_trip).to eq(nil)
    end
  end
end
