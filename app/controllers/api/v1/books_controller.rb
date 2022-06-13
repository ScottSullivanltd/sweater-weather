class Api::V1::BooksController < ApplicationController
  def index
    books = BooksFacade.get_location_books(params[:location], params[:quantity])
    render json: DestinationSerializer.new(books)
  end
end
