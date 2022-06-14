class Book
  attr_reader :isbn, :title, :publisher

  def initialize(attr)
    @isbn = attr[:isbn]
    @title = attr[:title]
    @publisher = attr[:publisher]
  end
end
