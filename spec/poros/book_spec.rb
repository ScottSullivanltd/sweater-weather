require "rails_helper"

RSpec.describe Book do
  it "creates a poro for a book", :vcr do
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
    book = Book.new(attr)

    # expect(book.total_books_found).to eq(668)
    expect(book.isbn[0]).to eq("9780762507849")
    expect(book.isbn[1]).to eq("0762507845")
    expect(book.title).to eq("Denver, Co.")
    expect(book.publisher[0]).to eq("Universal Map Enterprises")
  end
end
