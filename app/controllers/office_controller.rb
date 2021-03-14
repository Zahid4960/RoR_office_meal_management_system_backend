class OfficeController < ApplicationController

  require_relative '../services/office_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = office_service.index
      @data = @lists.paginate(page: params[:page], :per_page => @limit)
      if @data.length > 0
        render json: { status: "success", message: "Office data found!!!", data: @data }
      else
        render json: { status: "success", message: "Office data not found!!!", data: @data }
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def create
    begin
      if office_params.blank?
        render json: { status: 'error', message: 'Office name, address, contact & type can not null or empty!!!' }
      else
        @data = office_service.create(office_params)
        if @data
          @data = office_service.last_inserted
          render json: { status: 'success', message: 'Office saved successfully!!!', data: office_service.show(@data.id) }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear office failed to save!!!" }
    end
  end

  def show
    begin
      @office_by_id = office_service.show(params[:id])
      render json: { status: "success", message: "Data Found!!", data: @office_by_id }
    rescue
      render json: { status: "success", message: "Exception appears data not found!!!" }
    end
  end

  def update
    begin
      if update_office_params.blank?
        render json: { status: 'error', message: ' Office name, address, contact & type can not null or empty!!!' }
      else
        @data = office_service.update(params[:id], update_office_params)
        if @data
          @data = office_service.show(params[:id])
          render json: { status: "success", message: "Office data updated successfully!!!", data: @data }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear office failed to update!!!" }
    end
  end

  def destroy
    begin
      @data = office_service.destroy(params[:id])
      if @data
        render json: { status: "success", message: "Office data deleted successfully!!!" }
      end
    rescue
      render json: { status: "error", message: "Exception Appear (Office not found!!!)" }
    end
  end

  def office_params
    params.permit(
        :office_name,
      :office_address,
      :office_contact,
      :office_type_id
    )
  end

  def update_office_params
    params.permit(
      :office_name,
      :office_address,
      :office_contact,
      :office_type_id
    )
  end

  private
  def office_service
    @service = OfficeService.new
  end

end
