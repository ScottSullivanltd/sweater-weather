class DestinationInfo
  attr_reader :id, :destination_info, :forecast_info, :total_books_found, :book_info

  def initialize(attr)
    @destination_info = create_destination(location)
    @forecast_info = create_forecast(attr[:forecast])
    @total_books_found = book.total_books_found
    @book_info = Book.new(attr[:books])
  end

  def create_destination(location)
    params[:location]
  end

  def create_forecast(data)
    forecast[:summary] = current_weather.conditions
    forecaast[:temperature] = current_weather.temperature
  end
end
