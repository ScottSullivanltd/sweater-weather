class Api::V1::ForecastController < ApplicationController
  def index
    @forecast = ForecastFacade.get_forecast(params[:city], params[:state])
    render json: ForecastSerializer.new(forecast)
  end
end
