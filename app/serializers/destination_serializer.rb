class DestinationSerializer
  include JSONAPI::Serializer
  attributes :destination_info, :forecast_info, :total_books_found, :book_info
end
