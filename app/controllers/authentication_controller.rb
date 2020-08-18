class AuthenticationController < ApplicationController

# registration method
def registration
  begin
    @registration_data = User.new(registration_params)
    # save
    if @registration_data.save
      render json: {
        status: 'success',
        message: 'User Registration Successful!!',
        data: @registration_data
      }
    end
  rescue
    render json: {
      status: 'failed',
      message: 'Something Went Wrong!!!',
      data: @registration_data.errors
    }
  end
end


# private methods
private

# method for registration_params
def registration_params
  params.permit(
    :email,
    :user_name,
    :password
  )
end

end
