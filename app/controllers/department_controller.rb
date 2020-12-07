class DepartmentController < ApplicationController

  def index
    @department_data = Department.select(
      "departments.*",
      "offices.office_name"
    ).joins(:office)

    @limit = params[:limit] != nil ? params[:limit] : 10

    @paginated_department_data_lists = @department_data.paginate(page: params[:page], :per_page => @limit)
    render json: {
      status: "success",
      message: @paginated_department_data_lists == [] ? "Department data not found" : "Department Data Found",
      data: @paginated_department_data_lists
    }
  end

  def create
    @department_data = Department.new(department_params)

    if @department_data.save
      render json: {
        status: "success",
        message: "Department data saved successfully!!!",
        data:@department_data
      }
    else
      render json: {
        status: "error",
        message: @department_data.errors
      }
    end
  end

  def show
    begin
      @department_by_id = Department.find(params[:id])
      render json: {
        status: "succsess",
        message: "Department found for id #{params[:id]}",
        data: @department_by_id
      }
    rescue
      render json: {
        status: "error",
        message: "Exception appears data not updated!!!"
      }
    end
  end

  def update

  end

  private
  def department_params
    params.permit(
      :department_name,
      :office_id
    )
  end


end
