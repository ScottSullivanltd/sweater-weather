class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location]
      forecast = ForecastFacade.get_forecast(params[:location])
      render json: ForecastSerializer.new(forecast)
    else
      render json: {error: "Location not found"}, status: 400
    end
  end
end
