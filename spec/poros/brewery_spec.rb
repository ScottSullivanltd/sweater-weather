require "rails_helper"

RSpec.describe Brewery do
  it "creates a poro for a brewery", :vcr do
    attr = {
      name: "Denver Beer Co Olde Town Arvada",
      brewery_type: "micro"
    }
    brewery = Brewery.new(attr)

    expect(brewery.name).to eq("Denver Beer Co Olde Town Arvada")
    expect(brewery.brewery_type).to eq("micro")
  end
end
