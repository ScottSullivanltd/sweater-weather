class BooksFacade
  def self.get_location_books(location, quantity)
    book_data = BookService.get_books(location)

    books_found = book_data[:numFound]

    books = []
    book_data[:docs].first(quantity.to_i).map do |book|
      books << Book.new(book)
    end
    [books, books_found]
  end
end
