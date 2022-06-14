class BooksFacade
  def self.get_location_books(location, quantity)
    book_data = BookService.get_books(location)
    Book.new(book_data)
  end
end
