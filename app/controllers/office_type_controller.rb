class OfficeTypeController < ApplicationController

  require_relative '../services/office_type_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @data = office_type_service.index(params[:page], @limit)
      if @data.length > 0
        render json: { status: "success", message: "Office types data found!!!", data: @data }
      else
        render json: { status: "success", message: "Office types Data not found!!!", data: @data }
      end
    rescue => error
      render json: { status: "exception", message: "Exception appear at the office type data fetching!!!", exception: error.message }
    end
  end

  def create
    begin
      @data = office_type_service.store(office_type_params)
      @data = office_type_service.last_inserted
      render json: { status: 'success', message: 'Office type saved successfully!!!', data: @data }
    rescue => error
      render json: { status: "exception", message: "Exception appear office type failed to save!!!" , exception: error.message }
    end
  end

  def show
    begin
      @data = office_type_service.show(params[:id])
      render json: { status: "success", message: "Office type data found!!!", data: @data }
    rescue => error
      render json: { status: "exception", message: "Exception Appear office type data not found!!!", exception: error.message }
    end
  end

  def update
    begin
      @data = office_type_service.update(params[:id], update_office_type_params)
      render json: { status: "success", message: "Office type data updated successfully!!!", data: @data }
    rescue => error
      render json: { status: "exception", message: "Exception appear to update office type!!!", exception: error.message }
    end
  end

  def destroy
    begin
      @data = office_type_service.destroy(params[:id])
      render json: { status: "success", message: "Office type data deleted successfully!!!" }
    rescue => error
      render json: { status: "exception", message: "Exception Appear office type failed to delete!!!", exception: error.message }
    end
  end

  def office_type_params
    params.permit(:type_name)
  end

  def update_office_type_params
    params.permit(:type_name)
  end

  private
    def office_type_service
      @service = OfficeTypeService.new
  end

end
