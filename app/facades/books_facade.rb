class BooksFacade
  def self.get_location_books(location, quantity)
    BookService.get_books(location)
  end
end
