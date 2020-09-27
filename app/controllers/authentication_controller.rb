class AuthenticationController < ApplicationController

def registration
  registration_data = User.new(registration_params)
  registration_data[:plain_password] = registration_data[:password]
  encrypted_password = BCrypt::Password.create(registration_data[:password])
  registration_data[:password] = encrypted_password

  if registration_data.save
    render json: {
      status: 'success',
      message: 'Registration Successful!!',
      data: registration_data
    }
  else
    render json: {
      status: 'error',
      message: 'Registration Not Successful!!',
      errors: registration_data.errors
    }
  end
end


def login
  user_data = User.where(email: login_params[:email]).first
  if user_data.blank?
    render json: {
      staus: 'error',
      message: 'Invalid Email!!'
    }

  else
    if BCrypt::Password.new(user_data.password) == login_params[:password]
      session[:current_user_id] = user_data.id
      session[:current_user_email] = user_data.email
      render json: {
        status: 'success',
        message: 'Successfully loged In!!'
      }
    else
      render json: {
        status: 'error',
        message: 'Password Does Not Match!!'
      }
    end
  end
end


private

def registration_params
  params.permit(
    :email,
    :user_name,
    :password
  )
end

def login_params
  params.permit(
    :email,
    :password
  )
end

end
