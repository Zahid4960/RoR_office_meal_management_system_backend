class Api::V1::Employee::BasicInfosController < ApplicationController


    
    def index
        @basic_infos = ::Employee::BasicInfo.all
        render json: {
            status: 'success',
            message: 'Data Found',
            data: @basic_infos
        }
    end

    def create   
        @basic_info = ::Employee::BasicInfo.new(basic_info_params)   
        if @basic_info.save    
            render json: @basic_info
        else   
             render json: @basic_info.errors, status: :unprocessable_entity  
        end 
    end


    private

    def basic_info_params  
        params.permit(:first_name, :middle_name, :last_name)  
    end
    
end
