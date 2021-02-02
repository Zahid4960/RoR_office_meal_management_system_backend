class DayController < ApplicationController

  def index
    @day_lists = Day::all()

    render json: {
      status: 'success',
      message: @day_lists == [] ? 'Data not found!!!' : 'Data Found'
    }
  end


  private
  def day_params
    params.permit(:day)
  end
end
