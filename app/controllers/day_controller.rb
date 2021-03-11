class DayController < ApplicationController

  require_relative '../services/day_service'

  def index
    begin
      @limit = params['limit'] != nil ? params['limit'] : 10
      @lists = day_service.index
      @data = @lists.paginate(page: params[:page], :per_page => @limit)
      if @data.length > 0
        render json: { status: "success", message: "Day data found!!!", data: @data }
      else
        render json: { status: "success", message: "Day Data not found!!!", data: @data }
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def create
    begin
      if day_params.blank?
        render json: { status: 'error', message: 'day can not null or empty!!!' }
      else
        @data = day_service.create(day_params)
        if @data
          @data = day_service.last_inserted
          render json: { status: 'success', message: 'Day saved successfully!!!', data: @data }
        else
          render json: { status: 'error', message: 'Day failed to save (Day exists already!!!)' }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def show
    begin
      @data = day_service.show(params[:id])
      render json: { status: "success", message: "Day data found!!!", data: @data }
    rescue
      render json: { status: "error", message: "Exception Appear day data not found!!!" }
    end
  end

  def update
    begin
      if update_day_params.blank?
        render json: { status: 'error', message: 'Day can not null or empty!!!' }
      else
        @data = day_service.update(params[:id], update_day_params)
        if @data
          @data = day_service.show(params[:id])
          render json: { status: "success", message: "Day updated successfully!!!", data: @data }
        else
          render json: { status: 'error', message: 'Day failed to update (day exists already!!!)' }
        end
      end
    rescue
      render json: { status: "error", message: "Exception appear!!!" }
    end
  end

  def destroy
    begin
      @data = day_service.destroy(params[:id])
      if @data
        render json: { status: "success", message: "Day deleted successfully!!!" }
      end
    rescue
      render json: { status: "error", message: "Exception Appear (Day not found!!!)" }
    end
  end

  def day_params
    params.permit(:day)
  end

  def update_day_params
    params.permit(:day)
  end

  private
  def day_service
    @service = DayService.new
  end

end
