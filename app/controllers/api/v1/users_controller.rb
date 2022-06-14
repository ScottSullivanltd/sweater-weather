class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation] # && params[:email].uniq == true
      @user = user_params
      @user[:email] = @user[:email].downcase
      @new_user = User.create(@user)
      render json: UsersSerializer.new(@new_user), status: 201
    else
      render json: {error: "Credentials do not match"}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :api_key)
  end
end
