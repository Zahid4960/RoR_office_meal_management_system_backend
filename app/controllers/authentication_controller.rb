class AuthenticationController < ApplicationController

  def registration
    begin
      @registration_data = Hash.new
      @registration_data["email"] = registration_params[:email]
      @registration_data["user_name"] = registration_params[:user_name]
      @registration_data["plain_password"] = registration_params[:password]
      @registration_data["password"] = JWT.encode(registration_params[:password], "bitchcgpa4")
      @user = User.create!(@registration_data)
      @token = encode_token({user_id: @user.id})
      render json: {user: @user, token: @token}
    rescue => error
      render json: { status: "exception", message: "Exception appear failed to registration!!!", exception: error.message }
    end
  end

  def login
    @user = User.where(email: params[:email]).first
    @decoded_password = JWT::decode(@user.password, "bitchcgpa4", "true", algorithm: "HS256")
    if @decoded_password[0] == params[:password]
      @token = encode_token({user_id: @user.id})
      render json: { status: "success", message: "Login successful!!!", user: @user, token: @token }
    else
        render json: { status: "error", message: "Invalid username or password" }
    end
  end

  private
  def registration_params
    params.permit(:email, :user_name, :password)
  end

  def login_params
    params.permit(:email, :password)
  end

end
