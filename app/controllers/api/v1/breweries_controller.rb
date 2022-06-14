class Api::V1::BreweriesController < ApplicationController
  def index
    books = BreweriesFacade.get_location_breweries(params[:location], params[:quantity])

    weather = ForecastFacade.get_forecast(params[:location])

    render json: LocationSerializer.location_info(weather, params[:location], breweries)
  end
end
