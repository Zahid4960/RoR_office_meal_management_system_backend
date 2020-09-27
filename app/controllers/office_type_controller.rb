class OfficeTypeController < ApplicationController

  def index
    office_type_lists = OfficeType.limit(params[:limit]).offset(params[:offset])
    render json: office_type_lists
  end


  def create
    office_type_data = OfficeType.new(office_type_params)
    if office_type_data.save
      render json: {
        status: 'success',
        message: 'Office Type Saved Successfully!!',
        data: office_type_data
      }
    else
        render json: {
          status: 'error',
          message: office_type_data.errors
        }
    end
  end


  private

  def office_type_params
    params.permit(
      :type_name
    )
  end
end
