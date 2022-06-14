require "rails_helper"

RSpec.describe BooksFacade do
  describe "class methods" do
    it ".get_location_books", :vcr do
      location = "denver,co"
      quantity = 5
      book = BooksFacade.get_location_books(location, quantity)
      expect(book).to be_a(Book)
    end
  end
end
