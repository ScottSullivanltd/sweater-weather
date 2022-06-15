class Api::V1::UsersController < ApplicationController
  def create
    @user = user_params
    if !params[:email].nil?
      @user[:email] = @user[:email].downcase
    end
    @new_user = User.new(@user)

    if params[:password] == params[:password_confirmation] && !params[:email].nil?
      @new_user.save
      render json: UsersSerializer.new(@new_user), status: 201
    else
      render json: {error: "Credentials do not match"}, status: 400
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      render json: LoginSerializer.new(user), status: 200
    else
      render json: {error: "Credentials do not match"}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
