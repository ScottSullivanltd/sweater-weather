require "rails_helper"

RSpec.describe "Books API" do
  describe "books" do
    it "successfully returns list of books for given location", :vcr do
      all_params = {
        location: "denver,co",
        quantity: 5
      }

      get "/api/v1/book-search", params: all_params

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data]

      aggregate_failures do
        expect(data).to have_key(:id)
        expect(data[:id]).to be(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("books")
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to have_key(:destination)
        expect(data[:attributes]).to have_key(:forecast)
        expect(data[:attributes]).to have_key(:total_books_found)
        expect(data[:attributes]).to have_key(:books)

        forecast = data[:attributes][:forecast]
        expect(forecast).to have_key(:summary)
        expect(forecast[:summary]).to be_a(String)
        expect(forecast).to have_key(:temperature)
        expect(forecast[:temperature]).to be_an(String)

        books = data[:attributes][:books]
        expect(books).to have_key(:isbn)
        expect(books[:isbn]).to be_an(Array)
        expect(books).to have_key(:title)
        expect(books[:title]).to be_an(String)
        expect(books).to have_key(:publisher)
        expect(books[:publisher]).to be_an(Array)
      end
    end
  end
end
