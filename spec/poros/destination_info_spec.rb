require "rails_helper"

RSpec.describe DestinationInfo do
  it "creates a poro for destination info" do
    attr = {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: "denver,co",
          forecast: {
            summary: "Cloudy with a chance of meatballs",
            temperature: "83 F"
          },
          total_books_found: 172,
          books: [
            {
              isbn: [
                "0762507845",
                "9780762507849"
              ],
              title: "Denver, Co",
              publisher: [
                "Universal Map Enterprises"
              ]
            },
            {
              isbn: [
                "9780883183663",
                "0883183668"
              ],
              title: "Photovoltaic safety, Denver, CO, 1988",
              publisher: [
                "American Institute of Physics"
              ]
            }
          ]
        }
      }
    }
    books = Book.new(attr[:books])

    expect(attr[:data][:attributes][:destination]).to eq("denver,co")
    expect(attr[:data][:attributes][:forecast][:summary]).to eq("denver,co")
    expect(attr[:data][:attributes][:forecast][:temperature]).to eq("83 F")
  end
end
