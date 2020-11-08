class OfficeController < ApplicationController

  def index

    @office_lists = Office.select(
      "offices.id",
      "offices.office_name",
      "offices.office_address",
      "offices.office_contact",
      "offices.office_type_id",
      "office_types.type_name"
    ).joins(:office_type).where(:active => 1)

    @limit = params['limit'] != nil ? params['limit'] : 10

    @paginated_office_lists = @office_lists.paginate(page: params[:page], :per_page => @limit)

    render json: {
      status: "success",
      message: @paginated_office_lists == [] ? "No Data Found" : "Data Found" ,
      data: @paginated_office_lists
    }
  end


  def create
    @office_data = Office.new(office_params)
    if @office_data.save
      render json: {
        status: 'success',
        message: 'Office Information Saved Successfully!!',
        data: @office_data
      }
    else
      render json: {
        status: 'error',
        message: @office_data.errors
      }
    end
  end


  def show
    begin
      @office_by_id = Office.find(params[:id])
      render json: {
        status: "success",
        message: "Data Found!!",
        data: @office_by_id
      }
    rescue
      render json: {
        status: "success",
        message: "Exception appears data not found!!!"
      }
    end
  end


  private

  def office_params
    params.permit(
        :office_name,
      :office_address,
      :office_contact,
      :office_type_id
    )
  end
end
