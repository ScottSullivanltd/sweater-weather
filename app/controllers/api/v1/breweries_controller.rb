class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = BreweriesFacade.get_location_breweries(params[:location], params[:quantity])
    require "pry"
    binding.pry
    weather = ForecastFacade.get_forecast(params[:location])

    render json: LocationSerializer.location_info(weather, params[:location], breweries)
  end
end
