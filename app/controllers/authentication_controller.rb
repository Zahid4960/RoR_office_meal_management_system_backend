class AuthenticationController < ApplicationController
  # registration
  def registration
    render json: 'ok'
    render json: {
        status: 'success',
        message: 'No Data Found'
    }
  end

  private
  def registration_params
    params.require(
      :email,
      :user_name,
      :password
    ).permit(
      :email,
      :user_name,
      :password
    )
  end
end
