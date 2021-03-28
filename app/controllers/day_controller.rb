class DayController < ApplicationController

  before_action :authorized
  require_relative '../services/day_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = day_service.index(params[:page], @limit)
      if @lists.length > 0
        render json: { status: "success", message: "Day data found!!!", data: @lists }
      else
        render json: { status: "success", message: "Day Data not found!!!", data: @lists }
      end
    rescue => error
      render json: { status: "error", message: "Exception appear to fetching day data!!!", exception: error.message }
    end
  end

  private
  def day_service
    @service = DayService.new
  end

end
