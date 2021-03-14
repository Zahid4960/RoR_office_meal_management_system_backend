class DesignationController < ApplicationController

  require_relative '../services/designation_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = designation_service.index
      @data = @lists.paginate(page: params[:page], :per_page => @limit)
      if @data.length > 0
        render json: { status: "success", message: "Designation data found!!!", data: @data }
      else
        render json: { status: "success", message: "Designation data not found!!!", data: @data }
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def create
    begin
      if designation_params.blank?
        render json: { status: 'error', message: 'Designation name & office can not null or empty!!!' }
      else
        @data = designation_service.create(designation_params)
        if @data
          @data = designation_service.last_inserted
          render json: { status: 'success', message: 'Designation saved successfully!!!', data: designation_service.show(@data.id) }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear designation failed to save!!!" }
    end
  end

  def show
    begin
      @designation_by_id = designation_service.show(params[:id])
      render json: { status: "success", message: "Designation data Found!!!", data: @designation_by_id }
    rescue
      render json: { status: "success", message: "Exception appears Designation data not found!!!" }
    end
  end

  def update
    begin
      if update_designation_params.blank?
        render json: { status: 'error', message: ' Designation name & office can not null or empty!!!' }
      else
        @data = designation_service.update(params[:id], update_designation_params)
        if @data
          @data = designation_service.show(params[:id])
          render json: { status: "success", message: "Designation data updated successfully!!!", data: @data }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear designation failed to update!!!" }
    end
  end

  def destroy
    begin
      @data = designation_service.destroy(params[:id])
      if @data
        render json: { status: "success", message: "Designation data deleted successfully!!!" }
      end
    rescue
      render json: { status: "error", message: "Exception Appear (designation not found!!!)" }
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
