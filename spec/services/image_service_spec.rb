require "rails_helper"

RSpec.describe ImageService do
  describe "class methods" do
    it "get_image", :vcr do
      location = "denver,co"

      response = ImageService.get_image(location)
      results = response[:results][0]
      expect(results).to have_key(:description)
      expect(results[:description]).to be_a(String)
      expect(results).to have_key(:urls)
      expect(results[:urls]).to be_a(Hash)
      expect(results[:user]).to have_key(:name)
      expect(results[:user][:name]).to be_a(String)
      expect(results[:user]).to have_key(:portfolio_url)
      expect(results[:user][:portfolio_url]).to be_a(String)
    end
  end
end
