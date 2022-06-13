class Book
  attr_reader :id, :total_books_found, :books, :isnb, :title, :publisher

  def initialize(attr)
    @total_books_found = attr[:numFound]
  end
end
