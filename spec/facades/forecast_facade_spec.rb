require "rails_helper"

RSpec.describe ForecastFacade do
  describe "class methods" do
    it ".get_response_data", :vcr do
      location = "denver,co"
      response = ForecastFacade.get_response_data(location)
      expect(response).to be_a(Hash)
    end

    it ".get_forecast", :vcr do
      location = "denver,co"
      response = ForecastFacade.get_forecast(location)

      expect(response).to be_a(AllWeather)
    end
  end
end
