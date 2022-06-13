class Book
  attr_reader :id, :total_books_found, :isbn, :title, :publisher, :forecast

  def initialize(attr)
    @total_books_found = attr[:numFound]
    @isbn = attr[:docs][0][:isbn]
    @title = attr[:docs][0][:title]
    @publisher = attr[:docs][0][:publisher]
    @forecast = create_forcast_summary(destination)
  end
end
