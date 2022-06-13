require "rails_helper"

RSpec.describe BackgroundsFacade do
  describe "class methods" do
    it ".get_backgrounds", :vcr do
      location = "denver,co"
      response = BackgroundsFacade.get_backgrounds(location)
      expect(response).to be_a(Hash)
    end
  end
end
