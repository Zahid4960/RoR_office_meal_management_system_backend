class DepartmentController < ApplicationController

  before_action :authorized
  require_relative '../repositories/dept_repository'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = dept_service.index(params[:page], @limit)
      if @lists.length > 0
        render json: { status: "success", message: "Department data found!!!", data: @lists }
      else
        render json: { status: "success", message: "Department data not found!!!", data: @lists }
      end
    rescue => error
      render json: { status: "error", message: "Exception appear to fetching department data!!!", exception: error.message }
    end
  end

  def create
    begin
      @data = dept_service.create(department_params)
      render json: { status: 'success', message: 'Department saved successfully!!!', data: dept_service.show(@data.id) }
    rescue => error
      render json: { status: "error", message: "Exception appear department failed to save!!!", exception: error.message }
    end
  end

  def show
    begin
      @office_by_id = dept_service.show(params[:id])
      render json: { status: "success", message: "Department data Found!!!", data: @office_by_id }
    rescue => error
      render json: { status: "error", message: "Exception appears department data not found!!!", exception: error.message }
    end
  end

  def update
    begin
      @data = dept_service.update(params[:id], update_department_params)
      render json: { status: "success", message: "Department data updated successfully!!!", data: dept_service.show(params[:id]) }
    rescue => error
      render json: { status: "error", message: "Exception appear department failed to update!!!", exception: error.message }
    end
  end

  def destroy
    begin
      @data = dept_service.destroy(params[:id])
      render json: { status: "success", message: "Department data deleted successfully!!!" }
    rescue => error
      render json: { status: "error", message: "Exception Appear failed to delete department!!!", exception: error.message }
    end
  end

  def department_params
    params.permit(
      :department_name,
      :office_id
    )
  end

  def update_department_params
    params.permit(
      :department_name,
      :office_id
    )
  end

  private
  def dept_service
    @service = DeptService.new
  end

end
