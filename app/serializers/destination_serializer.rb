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
        total_books_found: books.count,
        books: [
          {
            isbn: [
              books.isbn[0],
              books.isbn[1]
            ],
            title: books.title,
            publisher: [
              books.publisher
            ]
          }
        ]
      }
    }
  end
end
