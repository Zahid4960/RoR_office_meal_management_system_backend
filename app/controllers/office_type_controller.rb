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
      if @data[:id] != nil
        @data = office_type_service.last_inserted
        render json: { status: 'success', message: 'Office type saved successfully!!!', data: @data }
      else
        render json: { status: 'error', error: @data.errors.full_messages.first }
      end
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
    # begin
    #   if update_office_type_params.blank?
    #     render json: { status: 'error', message: 'type_name can not null or empty!!!' }
    #   else
    # if update_office_type_params.validate!
    #   render json: "validate hoise"
    # else
    #   render json: "validate hoi nai"
    # end
        @data = office_type_service.update(params[:id], update_office_type_params)
    # render json: @data
    #     if @data
    #       @data = office_type_service.show(params[:id])
    #       render json: { status: "success", message: "Office type data updated successfully!!!", data: @data }
    #     else
          render json: { status: 'error', error: @data.errors.full_messages.first }
    #     end
    #   # end
    # rescue => error
    #   render json: { status: "exception", message: "Exception appear to update office type!!!", exception: error.message }
    # end
  end

  def destroy
    begin
      @data = office_type_service.destroy(params[:id])
      if @data
        render json: { status: "success", message: "Office type data deleted successfully!!!" }
      end
    rescue
      render json: { status: "error", message: "Exception Appear (Office type not found!!!)" }
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
