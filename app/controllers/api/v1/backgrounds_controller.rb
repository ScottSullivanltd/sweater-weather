class Api::V1::BackgroundsController < ApplicationController
  def index
    backgrounds = BackgroundsFacade.get_backgrounds(params[:location])
    render json: ImageSerializer.new(backgrounds)
  end
end
