require "rails_helper"

RSpec.describe BookService do
  describe "class methods" do
    it "get_books", :vcr do
      location = "denver,co"

      response = BookService.get_books(location)
      results = response[:docs][0]

      expect(results).to have_key(:title)
      expect(results[:title]).to be_a(String)
      expect(results).to have_key(:isbn)
      expect(results[:isbn]).to be_an(Array)
      expect(results).to have_key(:publisher)
      expect(results[:publisher]).to be_an(Array)
    end
  end
end
