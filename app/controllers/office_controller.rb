class OfficeController < ApplicationController

  def index
    @limit = params['limit'] != nil ? params['limit'] : 10
    @office_lists = Office.paginate(page: params[:page], :per_page => @limit)
    render json: @office_lists
  end


  def create
    @office_data = Office.new(office_params)
    if @office_data.save
      render json: {
        status: 'success',
        message: 'Office Information Saved Successfully!!',
        data: @office_data
      }
    else
      render json: {
        status: 'error',
        message: @office_data.errors
      }
    end
  end


  private

  def office_params
    params.permit(
      :office_name,
      :office_address,
      :office_contact,
      :office_type_id
    )
  end
end
