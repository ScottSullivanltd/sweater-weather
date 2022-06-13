require "rails_helper"

RSpec.describe BookService do
  describe "class methods" do
    it "get_books", :vcr do
      location = "denver,co"
      quantity = 5

      response = BookService.get_books(location, quantity)
      results = response[:docs][0]
    end
  end
end
