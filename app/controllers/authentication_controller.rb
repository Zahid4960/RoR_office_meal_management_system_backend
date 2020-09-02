class AuthenticationController < ApplicationController

# registration method
def registration
  registration_data = User.new(registration_params)

  # store plain password
  registration_data[:plain_password] = registration_data[:password]

  # password encryption
  encrypted_password = BCrypt::Password.create(registration_data[:password])

  # store encrypted password into the registration_params
  registration_data[:password] = encrypted_password

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

# login method
def login
  # find user by email
  user_data = User.where(email: login_params[:email]).first

  # if user data not found
  if user_data.blank?
    render json: {
      staus: 'error',
      message: 'Invalid Email!!'
    }
    #  if user data found
  else
    # if password match
    if BCrypt::Password.new(user_data.password) == login_params[:password]
      # set session data
      session[:current_user_id] = user_data.id
      session[:current_user_email] = user_data.email
      render json: {
        status: 'success',
        message: 'Successfully loged In!!'
      }
      #  if password does not match
    else
      render json: {
        status: 'error',
        message: 'Password Does Not Match!!'
      }
    end
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

# method for login params
def login_params
  params.permit(
    :email,
    :password
  )
end

end
