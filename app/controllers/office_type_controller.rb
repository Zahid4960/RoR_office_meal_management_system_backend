class OfficeTypeController < ApplicationController

  # require_relative '../repositories/office_type_repository'
  require_relative '../services/office_type_service'
  def index
    # @limit = params['limit'] != nil ? params['limit'] : 10
    # @office_type_lists = OfficeType.paginate(page: params[:page], :per_page => @limit)
    # render json: @office_type_lists

    # render json: repo.index
     @data = office_type_service.index
    render json: @data
  end


  def create
    @office_type_data = OfficeType.new(office_type_params)
    if @office_type_data.save
      render json: {
        status: 'success',
        message: 'Office Type Saved Successfully!!',
        data: @office_type_data
      }
    else
      render json: {
        status: 'error',
        message: @office_type_data.errors
      }
    end
  end


  def show
    begin
      @office_type_by_id = OfficeType.find(params[:id])
      render json: {
        status: "success",
        message: "Data Found!!",
        data: @office_type_by_id
      }
    rescue
      render json: {
        status: "success",
        message: "Exception appears data not found!!!"
      }
    end
  end


def update
  begin
      @office_type_by_id = OfficeType::find(params[:id])

      @update_office_type = @office_type_by_id.update(update_office_type_params)

      if @update_office_type
        render json: {
          status: "success",
          message: "Data Updated Successfully!!!",
          data: OfficeType::find(params[:id])
        }
      end
  rescue
    render json: {
      status: "error",
      message: "Exception appears data not updated!!!"
    }
  end
end


def destroy
  begin
    @office_type_by_id = OfficeType::find(params[:id])

    if @office_type_by_id.destroy
      render json: {
        status: "success",
        message: "Data Deleted Successfully!!!"
      }
    end
  rescue
    render json: {
      status: "success",
      message: "No Data Found!!!"
    }
  end
end


private

  def office_type_service
    @service ||= OfficeTypeService.new
  end
  #
  # def office_type_repo
  #   @repo ||= OfficeTypeRepository.new
  # end
  def office_type_params
    params.permit(
      :type_name
    )
  end

  def update_office_type_params
    params.permit(:type_name)
  end
end
