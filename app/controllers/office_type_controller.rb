class OfficeTypeController < ApplicationController

  def index
    office_type_lists = OfficeType.all
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


  def show
    @office_type_by_id = OfficeType.find(params[:id])

    if @office_type_by_id.blank?
      render json: {
        status: "success",
        message: "No Data Found!!!"
      }
    else
      render json: {
        status: "success",
        message: "Data Found!!",
        data: @office_type_by_id
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
