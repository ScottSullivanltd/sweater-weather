require "rails_helper"

RSpec.describe BackgroundsFacade do
  describe "class methods" do
    it ".get_backgrounds", :vcr do
      location = "denver,co"
      image = BackgroundsFacade.get_backgrounds(location)
      expect(image).to be_a(Image)
    end
  end
end
