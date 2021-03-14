class DepartmentController < ApplicationController

  require_relative '../repositories/dept_repository'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = dept_service.index
      @data = @lists.paginate(page: params[:page], :per_page => @limit)
      if @data.length > 0
        render json: { status: "success", message: "Department data found!!!", data: @data }
      else
        render json: { status: "success", message: "Department data not found!!!", data: @data }
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def create
    begin
      if department_params.blank?
        render json: { status: 'error', message: 'Department name & office can not null or empty!!!' }
      else
        @data = dept_service.create(department_params)
        if @data
          @data = dept_service.last_inserted
          render json: { status: 'success', message: 'Department saved successfully!!!', data: dept_service.show(@data.id) }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear department failed to save!!!" }
    end
  end

  def show
    begin
      @office_by_id = dept_service.show(params[:id])
      render json: { status: "success", message: "Department data Found!!!", data: @office_by_id }
    rescue
      render json: { status: "success", message: "Exception appears department data not found!!!" }
    end
  end

  def update
    begin
      if update_department_params.blank?
        render json: { status: 'error', message: ' Department name & office can not null or empty!!!' }
      else
        @data = dept_service.update(params[:id], update_department_params)
        if @data
          @data = dept_service.show(params[:id])
          render json: { status: "success", message: "Department data updated successfully!!!", data: @data }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear department failed to update!!!" }
    end
  end

  def destroy
    begin
      @data = dept_service.destroy(params[:id])
      if @data
        render json: { status: "success", message: "Department data deleted successfully!!!" }
      end
    rescue
      render json: { status: "error", message: "Exception Appear (department not found!!!)" }
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
