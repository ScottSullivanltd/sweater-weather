require "rails_helper"

RSpec.describe Brewery do
  it "creates a poro for a brewery", :vcr do
    attr = {
      numFound: 668,
      docs: [
        title: "Denver, Co.",
        isbn: [
          "9780762507849",
          "0762507845"
        ],
        publisher: [
          "Universal Map Enterprises"
        ]
      ]
    }
    brewery = Brewery.new(attr)

    expect(brewery.total_breweries_found).to eq(668)
    expect(brewery.isbn[0]).to eq("9780762507849")
    expect(brewery.isbn[1]).to eq("0762507845")
    expect(brewery.title).to eq("Denver, Co.")
    expect(brewery.publisher[0]).to eq("Universal Map Enterprises")
  end
end
