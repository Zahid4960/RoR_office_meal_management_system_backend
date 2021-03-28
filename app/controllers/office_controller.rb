class OfficeController < ApplicationController

  before_action :authorized
  require_relative '../services/office_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = office_service.index(params[:page], @limit)
      if @lists.length > 0
        render json: { status: "success", message: "Office data found!!!", data: @lists }
      else
        render json: { status: "success", message: "Office data not found!!!", data: @lists }
      end
    rescue => error
      render json: { status: "error", message: "Exception appear at the office data fetching!!!", exception: error.message }
    end
  end

  def create
    begin
      @data = office_service.create(office_params)
      render json: { status: 'success', message: 'Office saved successfully!!!', data: office_service.show(@data.id) }
    rescue => error
      render json: { status: "error", message: "Exception appear office failed to save!!!", exception: error.message }
    end
  end

  def show
    begin
      @office_by_id = office_service.show(params[:id])
      render json: { status: "success", message: "Office data Found!!", data: @office_by_id }
    rescue => error
      render json: { status: "error", message: "Exception appears to find office data!!!", exception: error.message }
    end
  end

  def update
    begin
      office_service.update(params[:id], update_office_params)
      @data = office_service.show(params[:id])
      render json: { status: "success", message: "Office data updated successfully!!!", data: @data }
    rescue => error
      render json: { status: "error", message: "Exception appear office failed to update!!!", exception: error.message }
    end
  end

  def destroy
    begin
      @data = office_service.destroy(params[:id])
      render json: { status: "success", message: "Office data deleted successfully!!!" }
    rescue => error
      render json: { status: "error", message: "Exception Appear failed to delete office data!!!", exception: error.message }
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
