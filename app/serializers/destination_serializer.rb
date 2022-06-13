class DestinationSerializer
  def self.destination_info(weather, location, books)
    {
      data: {
        id: nil,
        type: "books",
        attributes: {
          destination: location,
          forecast: {
            summary: weather.current_weather.conditions,
            temperature: weather.current_weather.temperature
          }
        },
        total_books_found: books[:numFound],
        books: books.map do |book|
                 Book.new(book)
               end
      }
    }
  end
end
