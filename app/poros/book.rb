class Book
  attr_reader :id, :total_books_found, :isbn, :title, :publisher

  def initialize(attr)
    @total_books_found = attr[:numFound]
    @isbn = attr[:docs][:isbn]
    @title = attr[:docs][:title]
    @publisher = attr[:docs][:publisher]
  end
end
