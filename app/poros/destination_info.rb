class DestinationInfo
  attr_reader :id, :destination_info, :forecast_info, :book_info

  def initialize(attr)
    @destination_info = create_destination(attr[:destination])
    @forecast_info = create_forecast(attr[:forecast])
    @book_info = create_books(attr[:books])
  end
end
