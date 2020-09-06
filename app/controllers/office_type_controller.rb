class OfficeTypeController < ApplicationController
 # method for store new office types
  def create
    # params data store into office_type_data
    office_type_data = OfficeType.new(office_type_params)
    # save data
    if office_type_data.save
      # if data save
      # success response
      render json: {
        status: 'success',
        message: 'Office Type Saved Successfully!!',
        data: office_type_data
      }
    else
        # data don't Save
        # error response
        render json: {
          status: 'error',
          message: office_type_data.errors
        }
    end
  end

  # private methods
  private

  # params for office types
  def office_type_params
    params.permit(
      :type_name
    )
  end
end
