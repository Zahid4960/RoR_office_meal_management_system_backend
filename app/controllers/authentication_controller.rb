class AuthenticationController < ApplicationController

# registration method
def registration
  registration_data = User.new(registration_params)

  # password encryption
  encrypted_password = BCrypt::Password.create(registration_data['password'])

  # store encrypted password into the registration_params
  registration_data['password'] = encrypted_password

  # save
  if registration_data.save
    # response
    render json: {
      status: 'success',
      message: 'Registration Successful!!',
      data: registration_data
    }
  else
    # error response
    render json: {
      status: 'error',
      message: 'Registration Not Successful!!',
      errors: registration_data.errors
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
