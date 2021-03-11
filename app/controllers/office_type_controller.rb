class OfficeTypeController < ApplicationController

  require_relative '../services/office_type_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = office_type_service.index
      @data = @lists.paginate(page: params[:page], :per_page => @limit)
      if @data.length > 0
        render json: { status: "success", message: "Office types data found!!!", data: @data }
      else
        render json: { status: "success", message: "Office types Data not found!!!", data: @data }
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def create
    begin
      if office_type_params.blank?
        render json: { status: 'error', message: 'type_name can not null or empty!!!' }
      else
        @data = office_type_service.create(office_type_params)
        if @data
          @data = office_type_service.last_inserted
          render json: { status: 'success', message: 'Office type saved successfully!!!', data: @data }
        else
          render json: { status: 'error', message: 'Office type failed to save (office type exists already!!!)' }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def show
    begin
      @data = office_type_service.show(params[:id])
      render json: { status: "success", message: "Office type data found!!!", data: @data }
    rescue
      render json: { status: "error", message: "Exception Appear office type data not found!!!" }
    end
  end

  def update
    begin
      if update_office_type_params.blank?
        render json: { status: 'error', message: 'type_name can not null or empty!!!' }
      else
        @data = office_type_service.update(params[:id], update_office_type_params)
        if @data
          @data = office_type_service.show(params[:id])
          render json: { status: "success", message: "Office type data updated successfully!!!", data: @data }
        else
          render json: { status: 'error', message: 'Office type failed to update (office type exists already!!!)' }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
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
