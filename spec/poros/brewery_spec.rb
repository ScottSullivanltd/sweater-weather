require "rails_helper"

RSpec.describe Brewery do
  it "creates a poro for a brewery", :vcr do
    attr = {
      id: "denver-beer-co-olde-town-arvada-denver",
      name: "Denver Beer Co Olde Town Arvada",
      brewery_type: "micro"
    }
    brewery = Brewery.new(attr)

    expect(brewery.brewery_id).to eq("denver-beer-co-olde-town-arvada-denver")
    expect(brewery.name).to eq("Denver Beer Co Olde Town Arvada")
    expect(brewery.brewery_type).to eq("micro")
  end
end
