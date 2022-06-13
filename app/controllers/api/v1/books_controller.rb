class Api::V1::BooksController < ApplicationController
  def index
    books = BooksFacade.get_location_books(params[:location], params[:quantity])
    weather = ForecastFacade.get_forecast(params[:location])
    # require "pry"
    # binding.pry
    render json: DestinationSerializer.destination_info(weather, params[:location], books)
  end
end
