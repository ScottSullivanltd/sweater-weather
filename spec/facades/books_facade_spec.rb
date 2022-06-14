require "rails_helper"

RSpec.describe BooksFacade do
  describe "class methods" do
    it ".get_location_books", :vcr do
      location = "denver,co"
      quantity = 5
      response = BooksFacade.get_location_books(location, quantity)
      expect(response).to be_a(Hash)
    end
  end
end
