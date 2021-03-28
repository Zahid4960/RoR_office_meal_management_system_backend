class DesignationController < ApplicationController

  before_action :authorized
  require_relative '../services/designation_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = designation_service.index(params[:page], @limit)
      if @lists.length > 0
        render json: { status: "success", message: "Designation data found!!!", data: @lists }
      else
        render json: { status: "success", message: "Designation data not found!!!", data: @lists }
      end
    rescue => error
      render json: { status: "error", message: "Exception appear at fetching designation data!!!", exception: error.message }
    end
  end

  def create
    begin
      @data = designation_service.create(designation_params)
      render json: { status: 'success', message: 'Designation saved successfully!!!', data: designation_service.show(@data.id) }
    rescue => error
      render json: { status: "error", message: "Exception appear designation failed to save!!!", exception: error.message }
    end
  end

  def show
    begin
      @designation_by_id = designation_service.show(params[:id])
      render json: { status: "success", message: "Designation data Found!!!", data: @designation_by_id }
    rescue => error
      render json: { status: "error", message: "Exception appears designation data not found!!!", exception: error.message }
    end
  end

  def update
    begin
      @data = designation_service.update(params[:id], update_designation_params)
      @data = designation_service.show(params[:id])
      render json: { status: "success", message: "Designation data updated successfully!!!", data: @data }
    rescue => error
      render json: { status: "error", message: "Exception appear designation failed to update!!!", exception: error.message }
    end
  end

  def destroy
    begin
      @data = designation_service.destroy(params[:id])
      render json: { status: "success", message: "Designation data deleted successfully!!!" }
    rescue => error
      render json: { status: "error", message: "Exception Appear failed to delete designation data", exception: error.message }
    end
  end

  def designation_params
    params.permit(
      :designation_name,
      :office_id
    )
  end

  def update_designation_params
    params.permit(
      :designation_name,
      :office_id
    )
  end

  private
  def designation_service
    @service = DesignationService.new
  end

end
