class Api::V1::BackgroundsController < ApplicationController
  def index
    backgrounds = BackgroundsFacade.get_backgrounds(params[:location])
    render json: BackgroundsSerializer.new(backgrounds)
  end
end
