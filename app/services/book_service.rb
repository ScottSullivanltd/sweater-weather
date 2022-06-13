class BookService < BaseService
  def get_books(location)
    response = conn("http://openlibrary.org").get("/search.json") do |f|
      f.params[q] = location
    end
    get_json(response)
  end
end
