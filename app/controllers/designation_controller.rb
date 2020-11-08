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
  end

  def update
  end

  def destroy
  end

  private

  def designation_params
    params.permit(
        :designation_name
    )
  end

end
