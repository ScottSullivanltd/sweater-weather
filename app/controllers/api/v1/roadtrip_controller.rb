class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil? || no_api_key?
      render json: {error: "Invalid API key"}, status: 401
    elsif params[:origin].present? && params[:destination].present?
      roadtrip = RoadtripsFacade.create_roadtrip(params[:origin], params[:destination])
      render json: {error: "impossible route"} if roadtrip.nil?
      render json: RoadtripSerializer.new(roadtrip), status: 201
    else
      render json: {error: "Incomplete Roadtrip Info"}, status: :bad_request
    end
  end

  private

  def no_api_key?
    !params[:api_key].present?
  end
end
