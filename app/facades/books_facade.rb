class BooksFacade
  def self.get_location_books(location, quantity)
    # book_data = BookService.get_books(location)
    # Book.new(book_data)
    # the below works but should be instanciated like above
    BookService.get_books(location)
  end
end
