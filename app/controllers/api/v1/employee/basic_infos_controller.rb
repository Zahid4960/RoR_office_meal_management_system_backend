class Api::V1::Employee::BasicInfosController < ApplicationController


    
    def index
        @basic_infos = ::Employee::BasicInfo.all

        if @basic_infos.blank?
            render json: { 
                status: 'success', 
                message: 'No Data Found', 
                data: @basic_infos 
            }
        else
         render json: { 
            status: 'success', 
            message: 'Data Found', 
            data: @basic_infos
        }
        end

    end

    def create   
        @create_basic_info = ::Employee::BasicInfo.new(basic_info_params)   
        if @create_basic_info.save    
            render json: { 
                status: 'success', 
                message: 'Data saved successfully' 
            }
        # else   
        #      render json: { status: :unprocessable_entity, @basic_info.errors }
        end 
    end

    def show
        begin
            @show_basic_info = ::Employee::BasicInfo.find(params[:id])

            render json: { 
                status: 'success', 
                message: 'Data Found', 
                data: @show_basic_info 
            }
        rescue    
            render json: { 
                status: 'success', 
                message: 'Data Not Found' 
            }
        end
    end

    def update
    end

    def destroy
    end

    private

    def basic_info_params  
        params.permit(
            :first_name, 
            :middle_name, 
            :last_name, 
            :sex, 
            :dop, 
            :nid, 
            :father_name, 
            :mother_name, 
            :present_address, 
            :permanent_address, 
            :status, 
            :user_id
        )  
    end
    
end
