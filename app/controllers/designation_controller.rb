class DesignationController < ApplicationController

  def index
    @limit = params['limit'] != nil ? params['limit'] : 10
    @designation_lists = Designation.paginate(page: params[:page], :per_page => @limit)
    render json: {
        message: 'success',
        data: @designation_lists
    }
  end

  def create
    @designation_data = Designation.new(designation_params)

    if @designation_data.save
      render json: {
          status: 'success',
          message: 'Designation Data Saved Successfully!!!',
          data: @designation_data
      }
    else
      render json: {
          status: 'error',
          message: @designation_data.errors
      }
    end
  end

  def show
    begin
    @designation_by_id = Designation.find(params[:id])

    render json: {
        status: 'success',
        message: 'Designation Data Found!!!',
        data: @designation_by_id
    }

    rescue
      render json: {
          status: 'error',
          message: 'Exception appears, something went wrong data for id' + ' ' + params[:id] + ' ' 'doesn\'t exist !!!'
      }
      end
  end

  def update
    begin
      @designation_by_id = Designation.find(params[:id])

      @update_designation_data = @designation_by_id.update(update_designation_params)

      if @update_designation_data
        render json: {
            status: 'success',
            message: 'Data updated successfully!!!',
            data: Designation.find(params[:id])
        }
      end

    rescue
      render json: {
          status: 'error',
          message: 'Exception appear, something went wrong. Data for id' + ' ' + params[:id] + ' ' + 'doesn\'t exist!!!'
      }
    end
  end

  def destroy
    begin
      @designation_by_id = Designation.find(params[:id])

      if @designation_by_id.destroy
        render json: {
            status: 'success',
            message: 'Designation Data Deleted Successfully!!!'
        }
      end

    rescue
      render json: {
          status: 'error',
          message: 'Exception appears, Something Went Wrong'
      }
    end
  end

  private

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

end
